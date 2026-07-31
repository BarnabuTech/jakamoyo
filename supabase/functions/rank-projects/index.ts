import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.58.0";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

const CATEGORY_THEME: Record<string, [string, string]> = {
  EDUCATION: ["Education Infrastructure", "Miundombinu ya Elimu"],
  HEALTH: ["Health Services", "Huduma za Afya"],
  ROADS: ["Roads & Connectivity", "Barabara na Uhusiano"],
  WATER: ["Water & Sanitation", "Maji na Usafi"],
  YOUTH: ["Youth Empowerment", "Uwezeshaji Vijana"],
  AGRICULTURE: ["Agriculture & Food Security", "Kilimo na Usalama wa Chakula"],
  ICT: ["Digital & ICT", "Dijitali na ICT"],
  MARKET: ["Markets & Trade", "Masoko na Biashara"],
  OTHER: ["Community Development", "Maendeleo ya Jamii"],
};

const COST_BAND_BEN = (n: number): "Low" | "Medium" | "High" => {
  if (n < 2000) return "Low";
  if (n < 8000) return "Medium";
  return "High";
};

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }
  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    // Fetch infrastructure gaps
    const { data: gapsData, error: gapsError } = await supabase
      .from("infrastructure_gaps")
      .select("ward_id, category, gap_description_en, gap_description_sw, severity");

    if (gapsError) {
      console.warn("Failed to fetch infrastructure gaps:", gapsError);
    }
    const gaps = gapsData ?? [];

    // Load analyzed submissions joined to wards + county
    const { data: rows, error } = await supabase
      .from("submission_analysis")
      .select(`
        category, sub_category, priority_score, beneficiary_group,
        summary_en, summary_sw, duplicate_group_id,
        submissions:submission_id (
          id, ward_id, estimated_beneficiaries_input, county_id,
          wards:ward_id ( name, lat, lng, population_estimate, voters_2022, counties:county_id(name) )
        )
      `)
      .eq("submissions.status", "ANALYZED");

    if (error) {
      return new Response(JSON.stringify({ error: error.message }), {
        status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // Group by (ward_id, category)
    type Group = {
      ward_id: string;
      ward_name: string;
      county_name: string;
      lat: number | null;
      lng: number | null;
      population: number | null;
      voters: number | null;
      category: string;
      sub_category: string;
      priority_sum: number;
      count: number;
      beneficiary_est: number;
      summaries_en: string[];
      summaries_sw: string[];
      group_ids: Set<string>;
    };

    const groups = new Map<string, Group>();
    for (const row of rows ?? []) {
      const sub = row.submissions;
      if (!sub || !sub.ward_id) continue;
      
      const ward = sub.wards;
      const key = `${sub.ward_id}|${row.category}`;
      if (!groups.has(key)) {
        groups.set(key, {
          ward_id: sub.ward_id,
          ward_name: ward?.name ?? "Unknown",
          county_name: ward?.counties?.name ?? "",
          lat: ward?.lat ?? null,
          lng: ward?.lng ?? null,
          population: ward?.population_estimate ?? null,
          voters: ward?.voters_2022 ?? null,
          category: row.category,
          sub_category: row.sub_category,
          priority_sum: 0,
          count: 0,
          beneficiary_est: 0,
          summaries_en: [],
          summaries_sw: [],
          group_ids: new Set(),
        });
      }
      const g = groups.get(key)!;
      g.priority_sum += Number(row.priority_score);
      g.count += 1;
      const ben = parseInt(String(sub.estimated_beneficiaries_input ?? "0").replace(/[^0-9]/g, ""), 10);
      if (!isNaN(ben) && ben > 0) g.beneficiary_est = Math.max(g.beneficiary_est, ben);
      if (row.summary_en) g.summaries_en.push(row.summary_en);
      if (row.summary_sw) g.summaries_sw.push(row.summary_sw);
      if (row.duplicate_group_id) g.group_ids.add(row.duplicate_group_id);
    }

    // Build project records
    const projects = Array.from(groups.values()).map((g) => {
      // Find matching infrastructure gap
      const matchingGap = gaps.find(gap => gap.ward_id === g.ward_id && gap.category === g.category);
      let gapBoost = 0;
      if (matchingGap) {
        gapBoost = matchingGap.severity === 'High' ? 0.15 : (matchingGap.severity === 'Medium' ? 0.10 : 0.05);
      }

      const avgPriority = g.priority_sum / g.count;
      const dupBoost = Math.min(0.15, g.group_ids.size * 0.03);
      const demandBoost = g.count > 3 ? 0.08 : g.count > 1 ? 0.04 : 0;
      const popBoost = g.population && g.population > 50000 ? 0.05 : 0;
      
      const finalScore = Math.min(0.99, Number((avgPriority + dupBoost + demandBoost + popBoost + gapBoost).toFixed(2)));

      const [themeEn, themeSw] = CATEGORY_THEME[g.category] ?? CATEGORY_THEME.OTHER;
      const ben = g.beneficiary_est || g.population || g.count * 1500;
      const costBand = COST_BAND_BEN(ben);

      let justificationEn =
        `This project in ${g.ward_name} ward (${g.county_name}) addresses ${g.count} citizen request(s) ` +
        `with an average priority of ${(avgPriority * 100).toFixed(0)}%. It serves an estimated ${ben.toLocaleString()} ` +
        `beneficiaries and aligns with the ${themeEn} development pillar. ${g.group_ids.size > 1 ? "Multiple overlapping submissions were detected, reinforcing demand." : ""}`;
      
      let justificationSw =
        `Mradi huu katika kata ya ${g.ward_name} (${g.county_name}) unajibu maombi ${g.count} ya wananchi ` +
        `yenye kipaumbele cha wastani ${(avgPriority * 100).toFixed(0)}%. Utawahudumia takriban ${ben.toLocaleString()} ` +
        `watu na unalingana na ngazi ya ${themeSw}. ${g.group_ids.size > 1 ? "Maombi yanayofanana yamegunduliwa, yakiongeza madai." : ""}`;

      if (matchingGap) {
        justificationEn += ` CRITICAL ALIGNMENT: This project aligns with a documented infrastructure gap ("${matchingGap.gap_description_en}").`;
        justificationSw += ` MUHIMU: Mradi huu unaendana na pengo la miundombinu lililothibitishwa ("${matchingGap.gap_description_sw}").`;
      }

      return {
        title: `${themeEn}: ${g.sub_category} in ${g.ward_name}`,
        ward_id: g.ward_id,
        ward_name: g.ward_name,
        county_name: g.county_name,
        lat: g.lat,
        lng: g.lng,
        population: g.population,
        voters: g.voters,
        theme: themeEn,
        theme_sw: themeSw,
        category: g.category,
        sub_category: g.sub_category,
        priority_score: finalScore,
        backing_submissions_count: g.count,
        beneficiary_count_estimate: ben,
        cost_band: costBand,
        justification_en: justificationEn,
        justification_sw: justificationSw,
        top_summary_en: g.summaries_en[0] ?? "",
        top_summary_sw: g.summaries_sw[0] ?? "",
      };
    });

    projects.sort((a, b) => b.priority_score - a.priority_score);

    // Persist to recommended_projects (replace existing DRAFT rows)
    await supabase.from("recommended_projects").delete().eq("status", "DRAFT");
    if (projects.length > 0) {
      const toInsert = projects.map((p) => ({
        title: p.title,
        ward_id: p.ward_id,
        theme: p.theme,
        category: p.category,
        priority_score: p.priority_score,
        backing_submissions_count: p.backing_submissions_count,
        beneficiary_count_estimate: p.beneficiary_count_estimate,
        cost_band: p.cost_band,
        justification_en: p.justification_en,
        justification_sw: p.justification_sw,
        status: "DRAFT",
      }));
      // Insert in chunks of 50
      for (let i = 0; i < toInsert.length; i += 50) {
        await supabase.from("recommended_projects").insert(toInsert.slice(i, i + 50));
      }
    }

    return new Response(JSON.stringify({ projects, count: projects.length }), {
      headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  } catch (err) {
    return new Response(JSON.stringify({ error: String(err?.message ?? err) }), {
      status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
