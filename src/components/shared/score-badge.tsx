import { cn } from '@/lib/utils';

export function ScoreBadge({ score, label }: { score: number; label?: string }) {
  const pct = Math.round(score * 100);
  const tier = pct >= 80 ? 'high' : pct >= 60 ? 'medium' : 'low';
  const styles = {
    high: 'bg-green-600 text-white',
    medium: 'bg-accent text-accent-foreground',
    low: 'bg-muted text-muted-foreground',
  };
  return (
    <span className={cn('inline-flex items-center gap-1.5 rounded-full px-2.5 py-0.5 text-xs font-semibold', styles[tier])}>
      {label && <span className="opacity-80">{label}</span>}
      {pct}%
    </span>
  );
}

export function CostBandBadge({ band }: { band: 'Low' | 'Medium' | 'High' }) {
  const styles = {
    Low: 'bg-green-50 text-green-700 border-green-200',
    Medium: 'bg-amber-50 text-amber-700 border-amber-200',
    High: 'bg-rose-50 text-rose-700 border-rose-200',
  };
  return (
    <span className={cn('inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-medium', styles[band])}>
      {band}
    </span>
  );
}

export function StatusBadge({ status }: { status: string }) {
  const map: Record<string, { label: string; cls: string }> = {
    DRAFT: { label: 'Draft', cls: 'bg-slate-100 text-slate-600 border-slate-200' },
    APPROVED: { label: 'Approved', cls: 'bg-green-50 text-green-700 border-green-200' },
    IMPLEMENTED: { label: 'Implemented', cls: 'bg-primary/10 text-primary border-primary/20' },
    PENDING_AI: { label: 'Pending', cls: 'bg-amber-50 text-amber-700 border-amber-200' },
    ANALYZED: { label: 'Analyzed', cls: 'bg-blue-50 text-blue-700 border-blue-200' },
    FLAGGED_DUPLICATE: { label: 'Duplicate', cls: 'bg-orange-50 text-orange-700 border-orange-200' },
    MERGED: { label: 'Merged', cls: 'bg-violet-50 text-violet-700 border-violet-200' },
    ARCHIVED: { label: 'Archived', cls: 'bg-slate-100 text-slate-500 border-slate-200' },
  };
  const s = map[status] ?? { label: status, cls: 'bg-slate-100 text-slate-600 border-slate-200' };
  return (
    <span className={cn('inline-flex items-center rounded-full border px-2.5 py-0.5 text-xs font-medium', s.cls)}>
      {s.label}
    </span>
  );
}
