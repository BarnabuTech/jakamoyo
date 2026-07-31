import { useEffect, useState } from 'react';
import { supabase } from './supabase';
import type { County, Constituency, Ward } from './types';

interface AreasState {
  counties: County[];
  constituencies: Constituency[];
  wards: Ward[];
  loading: boolean;
  error: string | null;
}

// Temporarily disabled cache to debug data loading issues
// let cache: AreasState | null = null;

export function useAreas(): AreasState & {
  constituenciesForCounty: (countyId: string) => Constituency[];
  wardsForConstituency: (constituencyId: string) => Ward[];
  wardsForCounty: (countyId: string) => Ward[];
} {
  const [state, setState] = useState<AreasState>({ counties: [], constituencies: [], wards: [], loading: true, error: null });

  useEffect(() => {
    let mounted = true;
    (async () => {
      console.log('Loading areas data...');
      const [c, con, w] = await Promise.all([
        supabase.from('counties').select('id, name, code').order('name'),
        supabase.from('constituencies').select('id, name, code, county_id').order('name'),
        supabase.from('wards')
          .select('id, name, ward_code, constituency_id, county_id, population_estimate, voters_2022, lat, lng')
          .order('name'),
      ]);
      
      console.log('Areas query results:', { counties: c, constituencies: con, wards: w });
      
      if (!mounted) return;
      if (c.error || con.error || w.error) {
        console.error('Areas loading errors:', { cError: c.error, conError: con.error, wError: w.error });
        setState({ counties: [], constituencies: [], wards: [], loading: false, error: `Failed to load areas: ${c.error?.message || con.error?.message || w.error?.message}` });
        return;
      }
      const next: AreasState = {
        counties: c.data as County[],
        constituencies: con.data as Constituency[],
        wards: w.data as Ward[],
        loading: false,
        error: null,
      };
      setState(next);
      console.log('Areas loaded successfully:', { countyCount: next.counties.length, constituencyCount: next.constituencies.length, wardCount: next.wards.length });
    })();
    return () => { mounted = false; };
  }, []);

  const constituenciesForCounty = (countyId: string) =>
    state.constituencies.filter((c) => c.county_id === countyId);
  const wardsForConstituency = (constituencyId: string) =>
    state.wards.filter((w) => w.constituency_id === constituencyId);
  const wardsForCounty = (countyId: string) =>
    state.wards.filter((w) => w.county_id === countyId);

  return { ...state, constituenciesForCounty, wardsForConstituency, wardsForCounty };
}

export function wardNameById(wards: Ward[], id: string | null): string {
  if (!id) return '';
  return wards.find((w) => w.id === id)?.name ?? '';
}

export function countyNameById(counties: County[], id: string | null): string {
  if (!id) return '';
  return counties.find((c) => c.id === id)?.name ?? '';
}
