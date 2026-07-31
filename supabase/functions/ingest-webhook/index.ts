import "jsr:@supabase/functions-js/edge-runtime.d.ts";
import { createClient } from "npm:@supabase/supabase-js@2.58.0";

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
  "Access-Control-Allow-Headers": "Content-Type, Authorization, X-Client-Info, Apikey",
};

interface WebhookPayload {
  sender_id: string; // e.g. phone number
  message: string;
  media_url?: string; // audio or image URL
  media_type?: string; // 'audio' or 'image'
  location_hint?: string; // e.g. extracted from user profile or explicit keyword in message
}

Deno.serve(async (req: Request) => {
  if (req.method === "OPTIONS") {
    return new Response(null, { status: 200, headers: corsHeaders });
  }

  try {
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL")!,
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!,
    );

    // Verify it's a POST request
    if (req.method !== "POST") {
      return new Response(JSON.stringify({ error: "Method not allowed" }), {
        status: 405, headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    const payload: WebhookPayload = await req.json();

    if (!payload.sender_id || !payload.message) {
      return new Response(JSON.stringify({ error: "Missing sender_id or message" }), {
        status: 400, headers: { ...corsHeaders, "Content-Type": "application/json" },
      });
    }

    // Advanced: Lookup location based on sender history or hints
    // For MVP, if a location_hint is provided, we try to match it to a ward
    let wardId = null;
    let countyId = null;
    let constituencyId = null;

    if (payload.location_hint) {
      const { data: ward } = await supabase
        .from("wards")
        .select("id, county_id, constituency_id")
        .ilike("name", `%${payload.location_hint}%`)
        .limit(1)
        .maybeSingle();

      if (ward) {
        wardId = ward.id;
        countyId = ward.county_id;
        constituencyId = ward.constituency_id;
      }
    }

    // Process media (mock downloading and storing into Supabase format)
    let photoData = null;
    let audioMeta = null;

    if (payload.media_url) {
      if (payload.media_type === "image") {
        // In reality, download the image and convert to base64 or upload to Supabase Storage
        photoData = `data:image/jpeg;base64,...(downloaded_from_${payload.media_url})`;
      } else if (payload.media_type === "audio") {
        // Mock audio meta format
        audioMeta = { source_url: payload.media_url, type: "whatsapp_voice_note" };
      }
    }

    // Insert into submissions
    const { data: submission, error } = await supabase
      .from("submissions")
      .insert({
        description: payload.message,
        citizen_hash: payload.sender_id, // simple hash or raw ID for MVP
        ward_id: wardId,
        county_id: countyId,
        constituency_id: constituencyId,
        photo_data: photoData,
        audio_meta: audioMeta,
        status: "PENDING_AI", // ready for analysis
      })
      .select("id")
      .single();

    if (error) {
      throw error;
    }

    // Optionally trigger analyze-submission edge function here or rely on cron/batch job
    // For MVP we just queue it.

    return new Response(JSON.stringify({ 
      success: true, 
      submission_id: submission.id,
      message: "Submission received and queued for AI analysis." 
    }), {
      status: 201, headers: { ...corsHeaders, "Content-Type": "application/json" },
    });

  } catch (err) {
    console.error("Webhook error:", err);
    return new Response(JSON.stringify({ error: String(err?.message ?? err) }), {
      status: 500, headers: { ...corsHeaders, "Content-Type": "application/json" },
    });
  }
});
