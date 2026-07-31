import { useEffect, useState, useCallback } from 'react';
import { supabase, callEdge } from './supabase';
import type { RecommendedProject, RankedProject, Submission, Ward, County } from './types';

interface DashData {
  projects: RankedProject[];
  submissions: Submission[];
  wards: Ward[];
  counties: County[];
  loading: boolean;
  error: string | null;
  refresh: () => Promise<void>;
}

export function useDashboardData(): DashData {
  const [projects, setProjects] = useState<RankedProject[]>([]);
  const [submissions, setSubmissions] = useState<Submission[]>([]);
  const [wards, setWards] = useState<Ward[]>([]);
  const [counties, setCounties] = useState<County[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const [projRes, subRes, wardRes, countyRes] = await Promise.all([
        supabase.from('recommended_projects')
          .select('id, title, ward_id, theme, category, priority_score, backing_submissions_count, beneficiary_count_estimate, cost_band, justification_en, justification_sw, status, created_at, wards:ward_id(name, lat, lng, population_estimate, voters_2022, county_id, counties:county_id(name))')
          .order('priority_score', { ascending: false }),
        supabase.from('submissions')
          .select('id, title, description, status, created_at, category_input, ward_id, estimated_beneficiaries_input, wards:ward_id(name, county_id, counties:county_id(name)), submission_analysis:submission_analysis(category, priority_score, summary_en, summary_sw, language_detected, duplicate_group_id)')
          .order('created_at', { ascending: false }),
        supabase.from('wards').select('id, name, ward_code, constituency_id, county_id, population_estimate, voters_2022, lat, lng'),
        supabase.from('counties').select('id, name, code'),
      ]);

      if (projRes.error) throw new Error(projRes.error.message);
      if (subRes.error) throw new Error(subRes.error.message);

      const enrichedProjects: RankedProject[] = (projRes.data as unknown as RecommendedProject[]).map((p) => {
        const w = p.wards as unknown as Ward & { counties?: County } | null;
        return {
          ...p,
          ward_name: w?.name,
          county_name: (w as unknown as { counties?: County })?.counties?.name,
          lat: w?.lat,
          lng: w?.lng,
          population: w?.population_estimate,
          voters: w?.voters_2022,
        };
      });

      setProjects(enrichedProjects);
      setSubmissions(subRes.data as unknown as Submission[]);
      setWards(wardRes.data as Ward[]);
      setCounties(countyRes.data as County[]);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Failed to load dashboard');
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { load(); }, [load]);

  const refresh = useCallback(async () => {
    try {
      await callEdge('rank-projects', { method: 'POST' });
      await load();
    } catch {
      await load();
    }
  }, [load]);

  return { projects, submissions, wards, counties, loading, error, refresh };
}
