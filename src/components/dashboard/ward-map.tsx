import { useEffect, useRef } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import { useLang } from '@/lib/language-context';
import type { RankedProject } from '@/lib/types';
import { CATEGORY_LABELS } from '@/lib/i18n';
import { CategoryBadge } from '@/components/shared/category-badge';

// Fix default marker icons (Leaflet's bundler issue)
delete (L.Icon.Default.prototype as unknown as { _getIconUrl?: unknown })._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png',
  iconUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png',
  shadowUrl: 'https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png',
});

const CATEGORY_COLORS: Record<string, string> = {
  EDUCATION: '#2563eb',
  HEALTH: '#e11d48',
  ROADS: '#d97706',
  WATER: '#0891b2',
  YOUTH: '#7c3aed',
  AGRICULTURE: '#16a34a',
  ICT: '#4f46e5',
  MARKET: '#ea580c',
  OTHER: '#64748b',
};

function scoreRadius(score: number): number {
  return 14 + score * 26;
}

export function WardMap({ projects }: { projects: RankedProject[] }) {
  const { lang } = useLang();
  const containerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<L.Map | null>(null);
  const layerRef = useRef<L.LayerGroup | null>(null);

  useEffect(() => {
    if (!containerRef.current || mapRef.current) return;

    const map = L.map(containerRef.current, {
      center: [-1.0, 37.5],
      zoom: 6,
      scrollWheelZoom: false,
    });
    mapRef.current = map;

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; OpenStreetMap',
      maxZoom: 18,
    }).addTo(map);

    layerRef.current = L.layerGroup().addTo(map);

    return () => {
      map.remove();
      mapRef.current = null;
      layerRef.current = null;
    };
  }, []);

  useEffect(() => {
    if (!mapRef.current || !layerRef.current) return;
    layerRef.current.clearLayers();

    for (const p of projects) {
      if (p.lat == null || p.lng == null) continue;
      const color = CATEGORY_COLORS[p.category] ?? '#64748b';
      const radius = scoreRadius(p.priority_score);

      const circle = L.circleMarker([p.lat, p.lng], {
        radius,
        fillColor: color,
        color: '#fff',
        weight: 2,
        opacity: 0.9,
        fillOpacity: 0.55,
      });

      const catLabel = CATEGORY_LABELS[p.category]?.[lang] ?? p.category;
      const popup = `
        <div style="min-width:200px;font-family:inherit">
          <div style="font-weight:600;font-size:13px;margin-bottom:4px;color:#0f172a">${p.ward_name ?? ''} · ${p.county_name ?? ''}</div>
          <div style="font-size:12px;color:#475569;margin-bottom:6px">${catLabel}</div>
          <div style="font-size:12px;line-height:1.4;color:#334155">${p.justification_en.slice(0, 120)}...</div>
          <div style="margin-top:6px;font-size:11px;color:#64748b">Priority ${Math.round(p.priority_score * 100)}% · ${p.backing_submissions_count} requests</div>
        </div>
      `;
      circle.bindPopup(popup);
      layerRef.current.addLayer(circle);
    }
  }, [projects, lang]);

  return (
    <div className="relative h-[480px] w-full overflow-hidden rounded-xl border border-border">
      <div ref={containerRef} className="h-full w-full" />
      {/* Legend */}
      <div className="absolute bottom-4 left-4 z-[500] rounded-lg border border-border bg-background/95 p-3 shadow-md backdrop-blur">
        <div className="mb-2 text-xs font-semibold text-foreground">{lang === 'en' ? 'Categories' : 'Kategoria'}</div>
        <div className="grid grid-cols-2 gap-x-3 gap-y-1">
          {Object.entries(CATEGORY_COLORS).map(([cat, color]) => (
            <div key={cat} className="flex items-center gap-1.5">
              <span className="h-2.5 w-2.5 rounded-full" style={{ background: color }} />
              <span className="text-[11px] text-muted-foreground">{CATEGORY_LABELS[cat]?.[lang] ?? cat}</span>
            </div>
          ))}
        </div>
        <div className="mt-2 border-t border-border pt-2 text-[11px] text-muted-foreground">
          {lang === 'en' ? 'Circle size = priority score' : 'Ukubwa wa duara = alama ya kipaumbele'}
        </div>
      </div>
    </div>
  );
}
