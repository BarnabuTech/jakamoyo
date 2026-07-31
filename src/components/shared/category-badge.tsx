import {
  GraduationCap, HeartPulse, Construction, Droplets, Users,
  Wheat, Wifi, Store, CircleDot, type LucideIcon,
} from 'lucide-react';
import { cn } from '@/lib/utils';
import { CATEGORY_LABELS } from '@/lib/i18n';
import type { Language } from '@/lib/types';

const ICONS: Record<string, LucideIcon> = {
  EDUCATION: GraduationCap,
  HEALTH: HeartPulse,
  ROADS: Construction,
  WATER: Droplets,
  YOUTH: Users,
  AGRICULTURE: Wheat,
  ICT: Wifi,
  MARKET: Store,
  OTHER: CircleDot,
};

const STYLES: Record<string, string> = {
  EDUCATION: 'bg-blue-50 text-blue-700 border-blue-200',
  HEALTH: 'bg-rose-50 text-rose-700 border-rose-200',
  ROADS: 'bg-amber-50 text-amber-700 border-amber-200',
  WATER: 'bg-cyan-50 text-cyan-700 border-cyan-200',
  YOUTH: 'bg-violet-50 text-violet-700 border-violet-200',
  AGRICULTURE: 'bg-green-50 text-green-700 border-green-200',
  ICT: 'bg-indigo-50 text-indigo-700 border-indigo-200',
  MARKET: 'bg-orange-50 text-orange-700 border-orange-200',
  OTHER: 'bg-slate-50 text-slate-700 border-slate-200',
};

export function CategoryBadge({ category, lang, size = 'sm' }: {
  category: string;
  lang: Language;
  size?: 'sm' | 'md';
}) {
  const Icon = ICONS[category] ?? CircleDot;
  const label = CATEGORY_LABELS[category]?.[lang] ?? category;
  return (
    <span
      className={cn(
        'inline-flex items-center gap-1.5 rounded-full border font-medium',
        STYLES[category] ?? STYLES.OTHER,
        size === 'sm' ? 'px-2.5 py-0.5 text-xs' : 'px-3 py-1 text-sm',
      )}
    >
      <Icon className={size === 'sm' ? 'h-3 w-3' : 'h-4 w-4'} />
      {label}
    </span>
  );
}

export function categoryIcon(category: string): LucideIcon {
  return ICONS[category] ?? CircleDot;
}
