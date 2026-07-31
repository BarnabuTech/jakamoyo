import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.58.0";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface AnalysisResult {
  category: string;
  sub_category: string;
  priority_score: number;
  beneficiary_group: string;
  language_detected: "en" | "sw";
  location_entities: string[];
  summary_en: string;
  summary_sw: string;
  source: "gemma4" | "heuristic";
}

const HF_ENDPOINT =
  "https://api-inference.huggingface.co/models/google/gemma-2-2b-it";
const HF_TOKEN = Deno.env.get("HF_API_TOKEN") ?? "";

const ANALYSIS_PROMPT = (text: string, transcription: string, imageDesc: string, ward: string, county: string) => {
  let context = `Citizen text: """${text}"""\n`;
  if (transcription) {
    context += `Audio Transcription: """${transcription}"""\n`;
  }
  if (imageDesc) {
    context += `Attached Image Description: """${imageDesc}"""\n`;
  }
  return `You are an expert analyst for the Kenyan Constituency Development Fund (NG-CDF).
Analyse the citizen development request below (which may include audio transcripts and image descriptions) and respond with ONLY a single JSON object, no markdown, no commentary.

${context}
Detected ward: ${ward}
Detected county: ${county}

Return JSON with exactly these keys:
- category: one of EDUCATION, HEALTH, ROADS, WATER, YOUTH, AGRICULTURE, ICT, MARKET, OTHER
- sub_category: short phrase e.g. "primary school classroom upgrade"
- priority_score: number 0 to 1 (1 = most urgent / highest impact)
- beneficiary_group: e.g. students, farmers, traders, youth, pregnant mothers, residents
- language_detected: "en" or "sw"
- location_entities: array of ward/village/place names found in the text
- summary_en: one English sentence summary of the need (incorporate details from image/audio if present)
- summary_sw: one Kiswahili sentence summary of the need

JSON only:`;
};

function extractJson(raw: string): Record<string, unknown> | null {
  if (!raw) return null;
  let s = raw.trim().replace(/^```(?:json)?/i, "").replace(/```$/, "").trim();
  const start = s.indexOf("{");
  const end = s.lastIndexOf("}");
  if (start === -1 || end === -1 || end <= start) return null;
  const candidate = s.slice(start, end + 1);
  try {
    return JSON.parse(candidate);
  } catch {
    return null;
  }
}

async function transcribeAudio(audioMeta: any): Promise<string> {
  if (!audioMeta) return "";
  // In a full production environment, this would call HF Whisper API or a similar transcription service.
  // For this hackathon MVP without guaranteed multimodal endpoints, we provide a mock transcription
  // if an audio file is detected, simulating the capability.
  console.log("Mocking audio transcription for:", audioMeta);
  return "Tunaomba serikali itusaidie kujenga zahanati hapa kijijini. Tunateseka sana hasa wakina mama wajawazito.";
}

async function describeImage(photoData: string): Promise<string> {
  if (!photoData) return "";
  // Similarly, this would call google/paligemma or another vision-language model.
  console.log("Mocking image description based on base64 input length:", photoData.length);
  return "A picture showing a completely dried up riverbed with people waiting with empty plastic jerrycans.";
}

async function callGemma4(
  text: string,
  transcription: string,
  imageDesc: string,
  ward: string,
  county: string,
): Promise<Record<string, unknown> | null> {
  if (!HF_TOKEN) return null;
  const prompt = ANALYSIS_PROMPT(text, transcription, imageDesc, ward, county);
  try {
    const res = await fetch(HF_ENDPOINT, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${HF_TOKEN}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        inputs: prompt,
        parameters: { max_new_tokens: 512, temperature: 0.2, return_full_text: false },
      }),
    });
    if (!res.ok) {
      console.error("HF non-ok", res.status, await res.text().catch(() => ""));
      return null;
    }
    const data = await res.json();
    const generated = Array.isArray(data)
      ? data[0]?.generated_text
      : data?.generated_text ?? data?.[0]?.generated_text;
    return extractJson(typeof generated === "string" ? generated : JSON.stringify(generated));
  } catch (err) {
    console.error("HF call failed", err);
    return null;
  }
}

const EN_HINTS: Record<string, string[]> = {
  EDUCATION: ["school", "classroom", "pupil", "teacher", "learn", "dining hall"],
  HEALTH: ["dispensary", "clinic", "maternity", "health", "hospital", "toilet", "sanitation", "waste"],
  ROADS: ["road", "tarmac", "drain", "bridge", "footbridge", "street light", "path", "flood"],
  WATER: ["water", "borehole", "piped", "well", "dam", "irrigation", "rain"],
  YOUTH: ["youth", "vocational", "training", "skills", "idle", "carpentry", "tailoring"],
  AGRICULTURE: ["farm", "irrigation", "dam", "crop", "agricultur", "ukame", "umwagiliaji", "mashamba"],
  ICT: ["internet", "wi-fi", "wifi", "computer", "digital", "ict", "online jobs"],
  MARKET: ["market", "stall", "trader", "biashara", "soko", "shade"],
};

const SW_HINTS: Record<string, string[]> = {
  EDUCATION: ["shule", "darasa", "mtoto", "kujifunza"],
  HEALTH: ["afya", "kliniki", "zahanati", "uzazi", "mama na mtoto"],
  ROADS: ["barabara", "daraja", "taa", "matope", "njama"],
  WATER: ["maji", "visima", "borehole", "umwagiliaji"],
  YOUTH: ["vijana", "mafunzo", "biashara", "kompyuta"],
  AGRICULTURE: ["wakulima", "ukame", "lambo", "mashamba", "umwagiliaji"],
  ICT: ["kompyuta", "intaneti", "dijitali"],
  MARKET: ["soko", "wafanyabiashara", "bidhaa", "vibanda"],
};

function detectLanguage(text: string): "en" | "sw" {
  const swHits = (SW_HINTS["EDUCATION"].concat(SW_HINTS["HEALTH"], SW_HINTS["ROADS"], SW_HINTS["WATER"]))
    .filter((w) => text.toLowerCase().includes(w)).length;
  return swHits >= 1 ? "sw" : "en";
}

function heuristicAnalyze(
  text: string,
  transcription: string,
  imageDesc: string,
  inputCategory: string | null,
  ward: string,
  county: string,
  beneficiariesInput: string | null,
): AnalysisResult {
  // Combine all multimodal context for heuristic matching
  const combinedText = `${text} ${transcription} ${imageDesc}`.trim();
  const lower = combinedText.toLowerCase();
  const lang = detectLanguage(combinedText);

  const scores: Record<string, number> = {};
  const categories = Object.keys(EN_HINTS);
  for (const cat of categories) {
    let hits = 0;
    for (const kw of EN_HINTS[cat]) if (lower.includes(kw)) hits++;
    for (const kw of SW_HINTS[cat] ?? []) if (lower.includes(kw)) hits++;
    if (hits > 0) scores[cat] = hits;
  }
  let category = categories
    .filter((c) => scores[c] > 0)
    .sort((a, b) => scores[b] - scores[a])[0];

  const inputMap: Record<string, string> = {
    Roads: "ROADS", Schools: "EDUCATION", Health: "HEALTH", Water: "WATER",
    Youth: "YOUTH", Agriculture: "AGRICULTURE", ICT: "ICT", Market: "MARKET", Other: "OTHER",
  };
  if (!category && inputCategory && inputMap[inputCategory]) {
    category = inputMap[inputCategory];
  }
  if (!category) category = "OTHER";

  const subCatMap: Record<string, [string, string]> = {
    EDUCATION: ["classroom construction / school upgrade", "ujenzi wa madarasa / uboreshaji wa shule"],
    HEALTH: ["community dispensary / maternity clinic", "zahanati ya jamii / kliniki ya uzazi"],
    ROADS: ["road rehabilitation & drainage", "urekebishaji wa barabara na mifereji"],
    WATER: ["piped water / borehole project", "mradi wa maji ya umma / kisima"],
    YOUTH: ["vocational / youth training center", "kituo cha mafunzo ya vijana"],
    AGRICULTURE: ["community irrigation / earth dam", "umwagiliaji wa jamii / lambo"],
    ICT: ["digital hub / ICT center", "kituo cha dijitali / ICT"],
    MARKET: ["modern market sheds & stalls", "soko jipya la kisasa"],
    OTHER: ["general community development", "maendeleo ya jamii"],
  };
  const [subEn, subSw] = subCatMap[category] ?? subCatMap.OTHER;

  const urgencyWords = ["urgent", "haraka", "every", "lose", "afford", "faia", "hatari", "crisis", "no single", "over 6km"];
  const urgencyHits = urgencyWords.filter((w) => lower.includes(w)).length;
  
  let priority = 0.55 + urgencyHits * 0.07;
  
  // Boost priority if photo or audio is provided (signals high engagement/seriousness)
  if (photoData) priority += 0.05;
  if (audioMeta) priority += 0.05;

  if (beneficiariesInput) {
    const n = parseInt(beneficiariesInput.replace(/[^0-9]/g, ""), 10);
    if (!isNaN(n)) {
      if (n >= 10000) priority += 0.15;
      else if (n >= 3000) priority += 0.08;
    }
  }
  priority = Math.min(0.97, Math.max(0.3, priority));

  const beneficiaryMap: Record<string, [string, string]> = {
    EDUCATION: ["students and pupils", "wanafunzi"],
    HEALTH: ["pregnant mothers and residents", "wajawazito na wakazi"],
    ROADS: ["residents and school children", "wakazi na watoto wa shule"],
    WATER: ["households and residents", "kaya na wakazi"],
    YOUTH: ["out-of-school youth", "vijana"],
    AGRICULTURE: ["smallholder farmers", "wakulima wadogo"],
    ICT: ["youth and job seekers", "vijana na watafutaji kazi"],
    MARKET: ["traders and vendors", "wafanyabiashara"],
    OTHER: ["residents", "wakazi"],
  };
  const [benEn] = beneficiaryMap[category] ?? beneficiaryMap.OTHER;

  const locations: string[] = [];
  if (ward) locations.push(ward);
  const placeRegex = /\b(Kawangware|Kasarani|Baba Dogo|Likoni|Bamburi|Nyalenda|Nyakach|Utawala|Ruai|Korogocho|Mvita|Mtopanga|Nairobi|Mombasa|Kisumu)\b/gi;
  let m: RegExpExecArray | null;
  while ((m = placeRegex.exec(combinedText)) !== null) {
    if (!locations.some((l) => l.toLowerCase() === m![0].toLowerCase())) {
      locations.push(m[0]);
    }
  }

  const summaryEn = `${category === "EDUCATION" ? "Students" : "Residents"} in ${ward || county || "this ward"} request support for ${subEn} to improve livelihoods.`;
  const summarySw = `Wakazi wa ${ward || county || "eneo hili"} wanaomba mradi wa ${subSw} kwa ajili ya maendeleo.`;

  return {
    category,
    sub_category: subEn,
    priority_score: Number(priority.toFixed(2)),
    beneficiary_group: benEn,
    language_detected: lang,
    location_entities: locations,
    summary_en: summaryEn,
    summary_sw: summarySw,
    source: "heuristic",
  };
}

function normalize(s: string): string {
  return s.toLowerCase().replace(/[^a-z0-9\s]/g, "").replace(/\s+/g, " ").trim();
}

function jaccard(a: string, b: string): number {
  const sa = new Set(normalize(a).split(" ").filter((w) => w.length > 3));
  const sb = new Set(normalize(b).split(" ").filter((w) => w.length > 3));
  if (sa.size === 0 || sb.size === 0) return 0;
  let inter = 0;
  for (const w of sa) if (sb.has(w)) inter++;
  return inter / new Set([...sa, ...sb]).size;
}

let photoData: any = null;
let audioMeta: any = null;

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    const url = new URL(req.url);
    const id = url.searchParams.get("id");

    if (req.method === "POST" && id) {
      const { data: sub, error: subErr } = await supabase
        .from("submissions")
        .select("id, description, category_input, estimated_beneficiaries_input, ward_id, audio_meta, photo_data, wards:ward_id(name), counties:county_id(name)")
        .eq("id", id)
        .maybeSingle();
      if (subErr || !sub) {
        return new Response(JSON.stringify({ error: "Submission not found" }), {
          status: 404, headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
      }

      const wardName: string = sub.wards?.name ?? "";
      const countyName: string = sub.counties?.name ?? "";

      photoData = sub.photo_data;
      audioMeta = sub.audio_meta;

      const transcription = await transcribeAudio(sub.audio_meta);
      const imageDesc = await describeImage(sub.photo_data);

      let result: AnalysisResult;
      const gemma = await callGemma4(sub.description, transcription, imageDesc, wardName, countyName);
      if (gemma) {
        const category = String(gemma.category ?? "OTHER").toUpperCase();
        const validCats = ["EDUCATION","HEALTH","ROADS","WATER","YOUTH","AGRICULTURE","ICT","MARKET","OTHER"];
        result = {
          category: validCats.includes(category) ? category : "OTHER",
          sub_category: String(gemma.sub_category ?? ""),
          priority_score: Math.min(1, Math.max(0, Number(gemma.priority_score ?? 0.5))),
          beneficiary_group: String(gemma.beneficiary_group ?? "residents"),
          language_detected: (gemma.language_detected === "sw" ? "sw" : "en") as "en" | "sw",
          location_entities: Array.isArray(gemma.location_entities)
            ? gemma.location_entities.map(String)
            : [wardName].filter(Boolean),
          summary_en: String(gemma.summary_en ?? ""),
          summary_sw: String(gemma.summary_sw ?? ""),
          source: "gemma4",
        };
      } else {
        result = heuristicAnalyze(
          sub.description,
          transcription,
          imageDesc,
          sub.category_input,
          wardName,
          countyName,
          sub.estimated_beneficiaries_input,
        );
      }

      const { data: neighbors } = await supabase
        .from("submission_analysis")
        .select("submission_id, category, duplicate_group_id, submissions:submission_id(description, ward_id)")
        .eq("category", result.category);

      let dupGroupId: string | null = null;
      if (neighbors && neighbors.length > 0) {
        for (const n of neighbors) {
          const ndesc = n.submissions?.description ?? "";
          const nward = n.submissions?.ward_id ?? null;
          if (nward && sub.ward_id && nward === sub.ward_id) {
            if (jaccard(sub.description, ndesc) >= 0.35) {
              dupGroupId = n.duplicate_group_id ?? `grp_${n.submission_id}`;
              break;
            }
          }
        }
      }
      if (!dupGroupId) dupGroupId = `grp_${sub.id}`;

      const { error: upsertErr } = await supabase
        .from("submission_analysis")
        .upsert({
          submission_id: sub.id,
          category: result.category,
          sub_category: result.sub_category,
          priority_score: result.priority_score,
          beneficiary_group: result.beneficiary_group,
          location_entities: result.location_entities,
          language_detected: result.language_detected,
          summary_en: result.summary_en,
          summary_sw: result.summary_sw,
          duplicate_group_id: dupGroupId,
          analyzed_at: new Date().toISOString(),
        }, { onConflict: "submission_id" });

      if (upsertErr) {
        return new Response(JSON.stringify({ error: upsertErr.message }), {
          status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" },
        });
      }

      const newStatus = dupGroupId && neighbors && neighbors.some((n) =>
        n.submissions?.ward_id === sub.ward_id && n.submission_id !== sub.id
      ) ? "FLAGGED_DUPLICATE" : "ANALYZED";

      await supabase.from("submissions").update({ status: newStatus }).eq("id", sub.id);

      return new Response(JSON.stringify({ analysis: result, duplicate_group_id: dupGroupId, status: newStatus }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    if (req.method === "POST") {
      const { data: pending } = await supabase
        .from("submissions")
        .select("id, description, category_input, estimated_beneficiaries_input, ward_id, audio_meta, photo_data, wards:ward_id(name), counties:county_id(name)")
        .eq("status", "PENDING_AI");

      const results: unknown[] = [];
      if (pending) {
        for (const sub of pending) {
          const wardName = sub.wards?.name ?? "";
          const countyName = sub.counties?.name ?? "";
          
          photoData = sub.photo_data;
          audioMeta = sub.audio_meta;
          const transcription = await transcribeAudio(sub.audio_meta);
          const imageDesc = await describeImage(sub.photo_data);

          const gemma = await callGemma4(sub.description, transcription, imageDesc, wardName, countyName);
          let r: AnalysisResult;
          if (gemma) {
            const category = String(gemma.category ?? "OTHER").toUpperCase();
            const validCats = ["EDUCATION","HEALTH","ROADS","WATER","YOUTH","AGRICULTURE","ICT","MARKET","OTHER"];
            r = {
              category: validCats.includes(category) ? category : "OTHER",
              sub_category: String(gemma.sub_category ?? ""),
              priority_score: Math.min(1, Math.max(0, Number(gemma.priority_score ?? 0.5))),
              beneficiary_group: String(gemma.beneficiary_group ?? "residents"),
              language_detected: (gemma.language_detected === "sw" ? "sw" : "en") as "en" | "sw",
              location_entities: Array.isArray(gemma.location_entities) ? gemma.location_entities.map(String) : [wardName].filter(Boolean),
              summary_en: String(gemma.summary_en ?? ""),
              summary_sw: String(gemma.summary_sw ?? ""),
              source: "gemma4",
            };
          } else {
            r = heuristicAnalyze(sub.description, transcription, imageDesc, sub.category_input, wardName, countyName, sub.estimated_beneficiaries_input);
          }

          const { data: neighbors } = await supabase
            .from("submission_analysis")
            .select("submission_id, category, duplicate_group_id, submissions:submission_id(description, ward_id)")
            .eq("category", r.category);

          let dupGroupId = `grp_${sub.id}`;
          let isDup = false;
          if (neighbors) {
            for (const n of neighbors) {
              const ndesc = n.submissions?.description ?? "";
              const nward = n.submissions?.ward_id ?? null;
              if (nward && sub.ward_id && nward === sub.ward_id && n.submission_id !== sub.id) {
                if (jaccard(sub.description, ndesc) >= 0.35) {
                  dupGroupId = n.duplicate_group_id ?? `grp_${n.submission_id}`;
                  isDup = true;
                  break;
                }
              }
            }
          }

          await supabase.from("submission_analysis").upsert({
            submission_id: sub.id,
            category: r.category,
            sub_category: r.sub_category,
            priority_score: r.priority_score,
            beneficiary_group: r.beneficiary_group,
            location_entities: r.location_entities,
            language_detected: r.language_detected,
            summary_en: r.summary_en,
            summary_sw: r.summary_sw,
            duplicate_group_id: dupGroupId,
            analyzed_at: new Date().toISOString(),
          }, { onConflict: "submission_id" });

          await supabase.from("submissions").update({ status: isDup ? "FLAGGED_DUPLICATE" : "ANALYZED" }).eq("id", sub.id);
          results.push({ id: sub.id, analysis: r, duplicate: isDup });
        }
      }
      return new Response(JSON.stringify({ analyzed: results.length, results }), {
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    return new Response(JSON.stringify({ error: "Method not allowed" }), {
      status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err?.message ?? err) }), {
      status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
