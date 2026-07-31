# Jakamoyo — From Citizen Voices to Constituency Priorities

> **GDG Pwani Hackathon · Track 1: People's Priorities — AI for Constituency Development Planning**

Jakamoyo is a multilingual civic-intelligence platform that turns scattered citizen development requests into ranked, evidence-backed works an MP, CDF manager, or analyst can act on. Citizens submit a need in English or Kiswahili; the platform attaches its location and evidence, extracts a structured issue with Gemma, detects recurring demand, and recommends the highest-impact projects for each ward.

## Project overview

Jakamoyo is built for **Track 1: People's Priorities — AI for Constituency Development Planning** at the GDG Pwani Hackathon. It connects two sides of constituency planning:

- **Citizens** submit development needs through a simple multilingual portal, with text today and a path to photo, voice, and messaging evidence.
- **Decision-makers** use an MP/CDF/analyst dashboard to understand demand hotspots, compare competing works, and move evidence-backed recommendations from draft to implementation.

Supabase provides the secure workflow layer—authentication, storage-ready submissions, PostgreSQL, geography, and dashboards—while Gemma converts unstructured reports into structured categories, urgency scores, summaries, beneficiaries, and location signals. Those signals are aggregated with infrastructure gaps and ward data to make local development priorities visible and explainable.

## Project problem statement

MPs and CDF offices receive development requests through public meetings, handwritten letters, social media, grievance portals, calls, and direct representations. The information is mostly unstructured, arrives through disconnected channels, and is difficult to compare fairly. As a result, recurring community needs can be missed, low-visibility wards can be underrepresented, and project choices can rely more on fragmented anecdotes than measurable demand and public-data context.

The challenge is to build a multilingual AI platform that accepts citizen suggestions through voice, text, photos, or messaging channels; identifies recurring needs and demand hotspots; combines those signals with demographic, geographic, infrastructure, and planning data; and recommends the development works an MP can act on today.

## The pitch

Constituency development planning still begins with paper registers, barazas, letters, calls, WhatsApp messages, and social-media posts. These signals are valuable but fragmented: an MP cannot objectively see which needs recur, which wards are underserved, or whether a proposed project is stronger than competing demands.

**Jakamoyo makes every citizen report computable.** It combines unstructured citizen input with Kenyan administrative geography, ward demographics, infrastructure-gap data, and project status to create an auditable priority list—not just another feedback form.

```text
Citizen voice, text, photo or message
             ↓
Gemma-powered multilingual understanding
             ↓
Structured need + location + urgency + beneficiaries
             ↓
Recurring-demand and hotspot detection
             ↓
Ranked, explainable development recommendations
             ↓
MP / CDF action: draft → approve → implement
```

## Why it fits the challenge

| Hackathon challenge | Jakamoyo response |
|---|---|
| Scattered citizen input | One multilingual intake flow for text, voice, photo, and future messaging channels. |
| Local frontier intelligence | Gemma is the analysis engine that converts raw reports into structured civic data. |
| Multimodal understanding | Text, image evidence, and voice transcripts provide one combined request context. |
| Actionable public systems | Ward-level ranking, demand hotspots, and project lifecycle views support CDF decision-making. |
| Fragmented public data | Geography, population/voter data, infrastructure gaps, and citizen demand are joined in one model. |

## What users can do

### Citizens

- Submit a development need in English or Kiswahili.
- Select County → Constituency → Ward for precise local accountability.
- Add a title, category, expected beneficiaries, and supporting photo/voice evidence.
- Receive an analysis preview: theme, urgency, detected language, and summary.
- See recent community requests without exposing a citizen's identity.

### MPs, CDF managers, and analysts

- View demand by ward, theme, and priority.
- See a map of development hotspots.
- Compare candidate projects side-by-side.
- Review the plain-language reason behind every recommendation.
- Move works through **Draft → Approved → Implemented**.
- Re-rank recommendations as new citizen evidence arrives.

## Gemma as the engine

The analysis flow asks Gemma for constrained JSON, rather than generic chat output:

```json
{
  "category": "WATER",
  "sub_category": "community borehole repair",
  "priority_score": 0.91,
  "beneficiary_group": "households and school children",
  "language_detected": "sw",
  "location_entities": ["Kisauni"],
  "summary_en": "Residents report a prolonged failure of the local water point.",
  "summary_sw": "Wakazi wanaripoti hitilafu ya muda mrefu ya kituo cha maji."
}
```

The platform then clusters similar reports in the same ward, measures backing demand, and combines that demand with local infrastructure evidence before ranking project recommendations.

### Multimodal demo path

For a zero-budget hackathon presentation, run an audio-capable **Gemma 4 E4B or 12B** model locally and use browser speech recognition as a resilient transcript fallback. The production-ready path is a protected multimodal endpoint called only from a Supabase Edge Function.

| Evidence | Current MVP behaviour | Hackathon-ready upgrade |
|---|---|---|
| Text | Submitted and analysed today. | Send directly to Gemma with ward context. |
| Photo | JPEG/PNG selection and preview; stored with the submission payload. | Store privately in Supabase Storage and pass to a multimodal Gemma endpoint. |
| Voice | Audio-file selection; the MVP saves its metadata. | Browser recording + Storage upload + transcript/audio analysis. |
| Messaging apps | Planned intake channel. | Webhook converts WhatsApp/SMS/social reports to the same submission schema. |

This distinction is deliberate: the MVP remains demoable without paid inference, while the architecture cleanly supports genuine Gemma multimodal analysis.

## Architecture

```text
React + Vite citizen portal / role dashboards
                 │
                 ▼
Supabase Auth · PostgreSQL · Row Level Security · Storage
                 │
                 ▼
Supabase Edge Functions
  ├─ analyze-submission  → Gemma JSON analysis / deterministic fallback
  ├─ rank-projects       → aggregate demand and create ranked works
  └─ meta-areas          → county, constituency, and ward metadata
                 │
                 ▼
Local Gemma demo server OR protected hosted Gemma endpoint
```

## Technology

| Layer | Choice |
|---|---|
| Web application | React 18, Vite, TypeScript, Tailwind CSS, shadcn/ui |
| Maps | Leaflet + OpenStreetMap |
| Identity | Supabase Auth (email/password, role-linked profiles) |
| Data | Supabase PostgreSQL with RLS |
| Backend | Supabase Edge Functions (Deno) |
| Intelligence | Gemma via a configurable endpoint, with deterministic fallback |
| Languages | English and Kiswahili |

## Data model

| Table | Role in the decision system |
|---|---|
| `counties`, `constituencies`, `wards` | Geographic routing and ward-level context |
| `submissions` | Raw citizen evidence and reporting status |
| `submission_analysis` | Gemma-derived category, urgency, summaries, and duplicate cluster |
| `infrastructure_gaps` | Known local service/infrastructure deficits |
| `recommended_projects` | Ranked works with demand backing, beneficiaries, cost band, and rationale |
| `profiles` | Role and constituency context for authenticated users |

## Ranking logic

Jakamoyo's recommendation score is designed to be explainable. It prioritises a work using:

1. Number of corroborating submissions in the ward.
2. AI-derived urgency and likely beneficiaries.
3. Repetition of the same category/location need.
4. Relevant infrastructure-gap and geographic context.
5. A human-readable justification in English and Kiswahili.

The result is a decision aid, not an automatic spending decision: elected representatives and CDF teams retain approval authority.

## Run locally

### Prerequisites

- Node.js 18+
- A Supabase project
- A `.env` file with `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`

```bash
npm install
npm run dev
npm run typecheck
npm run build
```

### Database setup

Apply the migrations in `supabase/migrations/` in order, then run the demo seed migration. The seed provides multilingual citizen reports, analysed examples, recommended projects, and Kenya-focused geography for a pitch-ready workflow.

If applying through Supabase SQL Editor, also apply the latest permission repair migration so the citizen location selector and dashboards can read the geography and project tables:

```text
20260731010000_007_fix_client_data_permissions.sql
```

### Demo accounts

Create the accounts through the app's **Sign Up** flow, choosing the matching role:

| Role | Email | Password |
|---|---|---|
| Citizen | `demo.citizen@jakamoyo.com` | `demo123` |
| MP | `demo.mp@jakamoyo.com` | `demo123` |
| Analyst | `demo.analyst@jakamoyo.com` | `demo123` |
| CDF Manager | `demo.cdf@jakamoyo.com` | `demo123` |

For a local demo, disable Supabase Auth email confirmation temporarily while creating these test accounts, then re-enable it.

## Configure AI safely

The current Edge Function reads its inference credential from a Supabase secret; never put an AI token in the frontend or commit it to Git.

```text
HF_API_TOKEN=...
```

For a local Gemma showcase, point the Edge Function or local development flow at the local model server and retain the fallback path if the model is unavailable. Before a production deployment, use private evidence storage, explicit user consent, retention limits, and role-restricted access to submitted media.

## Live demo script

1. A citizen submits a Kiswahili water request with a ward selected.
2. Show the structured Gemma analysis and English/Kiswahili summary.
3. Submit a second similar request from the same ward.
4. Open the analyst/MP dashboard to show the hotspot and increased backing demand.
5. Compare the ranked water project with another proposal.
6. Approve the recommended work and explain the evidence behind it.

## Responsible-use principles

- Citizen reports inform decisions; they do not replace public participation or elected oversight.
- Scores are explainable through backing requests, location, and stated rationale.
- Sensitive evidence should be private, minimised, and retained only as long as needed.
- AI output is reviewed by human decision-makers before a project is funded.

## License

Hackathon MVP for Kenyan constituency development planning.
