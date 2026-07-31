export type Category =
  | 'EDUCATION' | 'HEALTH' | 'ROADS' | 'WATER' | 'YOUTH'
  | 'AGRICULTURE' | 'ICT' | 'MARKET' | 'OTHER';

export type SubmissionStatus =
  | 'PENDING_AI' | 'ANALYZED' | 'FLAGGED_DUPLICATE' | 'MERGED' | 'ARCHIVED';

export type ProjectStatus = 'DRAFT' | 'APPROVED' | 'IMPLEMENTED';
export type CostBand = 'Low' | 'Medium' | 'High';
export type UserRole = 'MP' | 'CDF_MANAGER' | 'ANALYST' | 'CITIZEN';
export type Language = 'en' | 'sw';

export interface County {
  id: string;
  name: string;
  code: string;
}

export interface Constituency {
  id: string;
  name: string;
  code: string;
  county_id: string;
}

export interface Ward {
  id: string;
  name: string;
  ward_code: string;
  constituency_id: string;
  county_id: string;
  population_estimate: number | null;
  voters_2022: number | null;
  lat: number | null;
  lng: number | null;
}

export interface AreasResponse {
  counties: County[];
  constituencies: Constituency[];
  wards: Ward[];
}

export interface Submission {
  id: string;
  citizen_hash: string | null;
  title: string | null;
  description: string;
  language: string | null;
  county_id: string | null;
  constituency_id: string | null;
  ward_id: string | null;
  category_input: string | null;
  estimated_beneficiaries_input: string | null;
  photo_data: string | null;
  audio_meta: { name?: string; size?: number; duration?: number } | null;
  status: SubmissionStatus;
  created_at: string;
  wards?: Ward | null;
  counties?: County | null;
  submission_analysis?: SubmissionAnalysis | null;
}

export interface SubmissionAnalysis {
  id: string;
  submission_id: string;
  category: Category;
  sub_category: string;
  priority_score: number;
  beneficiary_group: string;
  location_entities: string[];
  language_detected: Language;
  summary_en: string;
  summary_sw: string;
  duplicate_group_id: string | null;
  analyzed_at: string;
  source?: 'gemma4' | 'heuristic';
}

export interface RecommendedProject {
  id: string;
  title: string;
  ward_id: string;
  theme: string;
  category: Category;
  priority_score: number;
  backing_submissions_count: number;
  beneficiary_count_estimate: number;
  cost_band: CostBand;
  justification_en: string;
  justification_sw: string;
  status: ProjectStatus;
  created_at: string;
  wards?: Ward | null;
}

export interface RankedProject extends RecommendedProject {
  ward_name?: string;
  county_name?: string;
  lat?: number | null;
  lng?: number | null;
  population?: number | null;
  voters?: number | null;
  theme_sw?: string;
  sub_category?: string;
  top_summary_en?: string;
  top_summary_sw?: string;
}

export interface Profile {
  id: string;
  full_name: string;
  role: UserRole;
  county_id: string | null;
  constituency_id: string | null;
  created_at: string;
}

export interface AnalysisResult {
  category: Category;
  sub_category: string;
  priority_score: number;
  beneficiary_group: string;
  language_detected: Language;
  location_entities: string[];
  summary_en: string;
  summary_sw: string;
  source: 'gemma4' | 'heuristic';
}

export interface AnalyzeResponse {
  analysis: AnalysisResult;
  duplicate_group_id: string;
  status: SubmissionStatus;
}

export const ROLE_ROUTES: Record<UserRole, string> = {
  CITIZEN: '/submit',
  MP: '/dashboard/mp',
  CDF_MANAGER: '/dashboard/cdf',
  ANALYST: '/dashboard/analyst',
};

export function roleRoute(role: UserRole | undefined | null): string {
  if (!role) return '/dashboard/mp';
  return ROLE_ROUTES[role] ?? '/dashboard/mp';
}

export interface RoleMeta {
  value: UserRole;
  en: string;
  sw: string;
  descEn: string;
  descSw: string;
  icon: 'UserCircle2' | 'Landmark' | 'Microscope' | 'ClipboardList';
  color: string;
}

export const ROLE_META: RoleMeta[] = [
  {
    value: 'CITIZEN',
    en: 'Citizen',
    sw: 'Mwananchi',
    descEn: 'Submit development requests for your ward',
    descSw: 'Wasilisha maombi ya maendeleo ya kata yako',
    icon: 'UserCircle2',
    color: 'text-blue-600 bg-blue-50',
  },
  {
    value: 'MP',
    en: 'MP / Member of Parliament',
    sw: 'Mbunge',
    descEn: 'View ranked priorities and approve projects',
    descSw: 'Ona kipaumbele na kuidhinisha miradi',
    icon: 'Landmark',
    color: 'text-primary bg-primary/10',
  },
  {
    value: 'ANALYST',
    en: 'Analyst',
    sw: 'Mchambuaji',
    descEn: 'Analyze submissions and project data',
    descSw: 'Chambua maombi na data ya miradi',
    icon: 'Microscope',
    color: 'text-accent bg-accent/10',
  },
  {
    value: 'CDF_MANAGER',
    en: 'CDF Manager',
    sw: 'Meneja wa CDF',
    descEn: 'Manage projects and track implementation',
    descSw: 'Simamia miradi na kufuata utekelezaji',
    icon: 'ClipboardList',
    color: 'text-success bg-success/10',
  },
];
