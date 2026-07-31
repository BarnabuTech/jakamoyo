import {
  MessageSquare, MapPin, TrendingUp, Users, Layers,
} from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { t, CATEGORY_LABELS } from '@/lib/i18n';
import { CategoryBadge } from '@/components/shared/category-badge';
import { ScoreBadge } from '@/components/shared/score-badge';
import { Card, CardContent } from '@/components/ui/card';
import type { RankedProject, Submission } from '@/lib/types';
import { cn } from '@/lib/utils';

interface Props {
  projects: RankedProject[];
  submissions: Submission[];
}

export function OverviewCards({ projects, submissions }: Props) {
  const { lang } = useLang();

  const totalSubs = submissions.length;
  const distinctCitizens = new Set(submissions.map((s) => s.citizen_hash).filter(Boolean)).size || totalSubs;
  const avgPriority = projects.length > 0
    ? projects.reduce((sum, p) => sum + p.priority_score, 0) / projects.length
    : 0;

  // Top themes by backing submissions
  const themeCounts = new Map<string, number>();
  for (const p of projects) {
    themeCounts.set(p.category, (themeCounts.get(p.category) ?? 0) + p.backing_submissions_count);
  }
  const topThemes = Array.from(themeCounts.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, 5);

  // High-demand wards
  const wardCounts = new Map<string, { name: string; count: number; score: number }>();
  for (const p of projects) {
    const key = p.ward_id;
    const existing = wardCounts.get(key);
    if (existing) {
      existing.count += p.backing_submissions_count;
      existing.score = Math.max(existing.score, p.priority_score);
    } else {
      wardCounts.set(key, { name: p.ward_name ?? '', count: p.backing_submissions_count, score: p.priority_score });
    }
  }
  const topWards = Array.from(wardCounts.values())
    .sort((a, b) => b.count - a.count)
    .slice(0, 5);

  const cards = [
    {
      icon: MessageSquare,
      label: t('overviewTotal', lang),
      value: totalSubs.toString(),
      sub: `${distinctCitizens} ${lang === 'en' ? 'citizens' : 'wananchi'}`,
      color: 'text-blue-600 bg-blue-50',
    },
    {
      icon: Layers,
      label: t('overviewThemes', lang),
      value: topThemes.length.toString(),
      sub: lang === 'en' ? 'active themes' : 'mada zenye shughuli',
      color: 'text-accent bg-accent/10',
    },
    {
      icon: MapPin,
      label: t('overviewWards', lang),
      value: topWards.length.toString(),
      sub: lang === 'en' ? 'wards with demand' : 'kata zenye madai',
      color: 'text-primary bg-primary/10',
    },
    {
      icon: TrendingUp,
      label: t('overviewAvg', lang),
      value: `${Math.round(avgPriority * 100)}%`,
      sub: lang === 'en' ? 'across projects' : 'katika miradi',
      color: 'text-success bg-success/10',
    },
  ];

  return (
    <div className="space-y-6">
      {/* Stat cards */}
      <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
        {cards.map((c, i) => (
          <Card key={i} className="border-border/60 shadow-sm transition-shadow hover:shadow-md">
            <CardContent className="p-5">
              <div className="flex items-center justify-between">
                <div className={cn('flex h-10 w-10 items-center justify-center rounded-xl', c.color)}>
                  <c.icon className="h-5 w-5" />
                </div>
              </div>
              <div className="mt-3 text-2xl font-bold text-foreground">{c.value}</div>
              <div className="text-xs font-medium text-muted-foreground">{c.label}</div>
              <div className="mt-0.5 text-[11px] text-muted-foreground/80">{c.sub}</div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* Top themes + wards */}
      <div className="grid gap-4 lg:grid-cols-2">
        <Card className="border-border/60 shadow-sm">
          <CardContent className="p-5">
            <div className="mb-4 flex items-center gap-2">
              <Layers className="h-4 w-4 text-accent" />
              <h3 className="text-sm font-semibold text-foreground">{t('overviewThemes', lang)}</h3>
            </div>
            <div className="space-y-2.5">
              {topThemes.map(([cat, count]) => (
                <div key={cat} className="flex items-center justify-between">
                  <CategoryBadge category={cat} lang={lang} />
                  <div className="flex items-center gap-2">
                    <div className="h-1.5 w-24 overflow-hidden rounded-full bg-muted">
                      <div
                        className="h-full rounded-full bg-accent"
                        style={{ width: `${Math.min(100, (count / topThemes[0][1]) * 100)}%` }}
                      />
                    </div>
                    <span className="w-6 text-right text-xs font-semibold text-foreground">{count}</span>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-sm">
          <CardContent className="p-5">
            <div className="mb-4 flex items-center gap-2">
              <MapPin className="h-4 w-4 text-primary" />
              <h3 className="text-sm font-semibold text-foreground">{t('overviewWards', lang)}</h3>
            </div>
            <div className="space-y-2.5">
              {topWards.map((w, i) => (
                <div key={i} className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <span className="flex h-6 w-6 items-center justify-center rounded-full bg-primary/10 text-xs font-bold text-primary">{i + 1}</span>
                    <span className="text-sm font-medium text-foreground">{w.name}</span>
                  </div>
                  <div className="flex items-center gap-2">
                    <span className="text-xs text-muted-foreground">{w.count} {lang === 'en' ? 'reqs' : 'maombi'}</span>
                    <ScoreBadge score={w.score} />
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
