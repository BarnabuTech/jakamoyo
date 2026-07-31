import { useState, useMemo, useEffect } from 'react';
import { Link } from 'react-router-dom';
import {
  LayoutDashboard, Loader2, RefreshCw, AlertCircle, Map as MapIcon,
  ListOrdered, BarChart3, GitCompare, CheckCircle2, Languages as LangIcon, MapPin,
  Plus, Inbox, Clock, UserCircle2,
} from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { useDashboardData } from '@/lib/dashboard-data';
import { useAuth } from '@/lib/auth-context';
import { useAreas, wardNameById } from '@/lib/areas';
import { t, CATEGORY_LABELS } from '@/lib/i18n';
import type { RankedProject, ProjectStatus, Language, UserRole, Submission } from '@/lib/types';
import { supabase } from '@/lib/supabase';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import {
  Tabs, TabsList, TabsTrigger, TabsContent,
} from '@/components/ui/tabs';
import {
  Select, SelectContent, SelectItem, SelectTrigger, SelectValue,
} from '@/components/ui/select';
import {
  Table, TableHeader, TableBody, TableHead, TableRow, TableCell,
} from '@/components/ui/table';
import { OverviewCards } from '@/components/dashboard/overview-cards';
import { WardMap } from '@/components/dashboard/ward-map';
import { CategoryBadge, categoryIcon } from '@/components/shared/category-badge';
import { ScoreBadge, CostBandBadge, StatusBadge } from '@/components/shared/score-badge';
import { toast } from 'sonner';
import { cn } from '@/lib/utils';

type Tab = 'overview' | 'projects' | 'map' | 'compare';

interface DashConfig {
  role: UserRole;
  titleKey: string;
  subKey: string;
  canApprove: boolean;
  canRegenerate: boolean;
}

const ROLE_DASH: Record<UserRole, DashConfig> = {
  MP: { role: 'MP', titleKey: 'dashMP', subKey: 'dashMPSub', canApprove: true, canRegenerate: true },
  CDF_MANAGER: { role: 'CDF_MANAGER', titleKey: 'dashCDF', subKey: 'dashCDFSub', canApprove: true, canRegenerate: true },
  ANALYST: { role: 'ANALYST', titleKey: 'dashAnalyst', subKey: 'dashAnalystSub', canApprove: false, canRegenerate: true },
  CITIZEN: { role: 'CITIZEN', titleKey: 'dashCitizen', subKey: 'dashCitizenSub', canApprove: false, canRegenerate: false },
};

export function DashboardPage({ role = 'MP' }: { role?: UserRole }) {
  const { lang } = useLang();
  const { profile, session } = useAuth();
  const cfg = ROLE_DASH[role];
  const { projects, submissions, loading, error, refresh } = useDashboardData();
  const [tab, setTab] = useState<Tab>('overview');
  const [showSwahili, setShowSwahili] = useState(false);
  const [filterCounty, setFilterCounty] = useState<string>('all');
  const [filterCategory, setFilterCategory] = useState<string>('all');
  const [regenerating, setRegenerating] = useState(false);

  const countiesInData = useMemo(() => {
    const map = new Map<string, string>();
    for (const p of projects) {
      if (p.wards?.county_id) map.set(p.wards.county_id, p.county_name ?? '');
    }
    return Array.from(map.entries()).map(([id, name]) => ({ id, name }));
  }, [projects]);

  const filteredProjects = useMemo(() => {
    return projects.filter((p) => {
      if (filterCounty !== 'all' && p.wards?.county_id !== filterCounty) return false;
      if (filterCategory !== 'all' && p.category !== filterCategory) return false;
      return true;
    });
  }, [projects, filterCounty, filterCategory]);

  const handleRegenerate = async () => {
    setRegenerating(true);
    try {
      await refresh();
      toast.success(t('regenerated', lang));
    } catch {
      toast.error(t('error', lang));
    } finally {
      setRegenerating(false);
    }
  };

  const updateProjectStatus = async (id: string, status: ProjectStatus) => {
    const { error } = await supabase.from('recommended_projects').update({ status }).eq('id', id);
    if (error) {
      toast.error(t('error', lang));
      return;
    }
    await refresh();
    toast.success(lang === 'en' ? 'Project updated' : 'Mradi umesasishwa');
  };

  if (loading) {
    return (
      <div className="flex min-h-[60vh] items-center justify-center">
        <div className="flex flex-col items-center gap-3">
          <Loader2 className="h-8 w-8 animate-spin text-primary" />
          <p className="text-sm text-muted-foreground">{t('loading', lang)}</p>
        </div>
      </div>
    );
  }

  if (error) {
    return (
      <div className="mx-auto max-w-md py-20 text-center">
        <AlertCircle className="mx-auto h-10 w-10 text-destructive" />
        <p className="mt-3 font-medium text-foreground">{t('error', lang)}</p>
        <p className="mt-1 text-sm text-muted-foreground">{error}</p>
        <Button onClick={refresh} variant="outline" className="mt-4">{t('retry', lang)}</Button>
      </div>
    );
  }

  if (role === 'CITIZEN') {
    return <CitizenDashboard lang={lang} profile={profile} />;
  }

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
      {/* Header */}
      <div className="mb-6 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
        <div>
          <div className="mb-2 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
            <LayoutDashboard className="h-3.5 w-3.5" />
            {profile ? `${profile.full_name} · ${cfg.role}` : cfg.role}
          </div>
          <h1 className="text-2xl font-bold tracking-tight text-foreground sm:text-3xl">{t(cfg.titleKey as never, lang)}</h1>
          <p className="mt-1 text-sm text-muted-foreground">{t(cfg.subKey as never, lang)}</p>
        </div>
        <div className="flex items-center gap-2">
          <Button variant="outline" size="sm" onClick={() => setShowSwahili((s) => !s)}>
            <LangIcon className="h-4 w-4" />
            {showSwahili ? 'Show English' : t('showSwahili', lang)}
          </Button>
          {cfg.canRegenerate && (
            <Button variant="outline" size="sm" onClick={handleRegenerate} disabled={regenerating}>
              {regenerating ? <Loader2 className="h-4 w-4 animate-spin" /> : <RefreshCw className="h-4 w-4" />}
              {t('regenerate', lang)}
            </Button>
          )}
        </div>
      </div>

      {/* Filters */}
      <div className="mb-6 flex flex-wrap items-center gap-3">
        <Select value={filterCounty} onValueChange={setFilterCounty}>
          <SelectTrigger className="w-[160px]"><SelectValue placeholder={t('fieldCounty', lang)} /></SelectTrigger>
          <SelectContent>
            <SelectItem value="all">{lang === 'en' ? 'All counties' : 'Kaunti zote'}</SelectItem>
            {countiesInData.map((c) => <SelectItem key={c.id} value={c.id}>{c.name}</SelectItem>)}
          </SelectContent>
        </Select>
        <Select value={filterCategory} onValueChange={setFilterCategory}>
          <SelectTrigger className="w-[160px]"><SelectValue placeholder={t('fieldCategory', lang)} /></SelectTrigger>
          <SelectContent>
            <SelectItem value="all">{lang === 'en' ? 'All categories' : 'Kategoria zote'}</SelectItem>
            {Object.keys(CATEGORY_LABELS).map((c) => (
              <SelectItem key={c} value={c}>{CATEGORY_LABELS[c][lang]}</SelectItem>
            ))}
          </SelectContent>
        </Select>
        <span className="text-sm text-muted-foreground">
          {filteredProjects.length} {lang === 'en' ? 'projects' : 'miradi'}
        </span>
      </div>

      {/* Tabs */}
      <Tabs value={tab} onValueChange={(v) => setTab(v as Tab)}>
        <TabsList className="mb-6 grid w-full grid-cols-2 sm:flex sm:w-auto">
          <TabsTrigger value="overview"><BarChart3 className="mr-1.5 h-4 w-4" />{t('tabOverview', lang)}</TabsTrigger>
          <TabsTrigger value="projects"><ListOrdered className="mr-1.5 h-4 w-4" />{t('tabProjects', lang)}</TabsTrigger>
          <TabsTrigger value="map"><MapIcon className="mr-1.5 h-4 w-4" />{t('tabMap', lang)}</TabsTrigger>
          <TabsTrigger value="compare"><GitCompare className="mr-1.5 h-4 w-4" />{t('tabCompare', lang)}</TabsTrigger>
        </TabsList>

        {/* Overview */}
        <TabsContent value="overview" className="animate-fade-in-up">
          <OverviewCards projects={filteredProjects} submissions={submissions} />
          {/* Category distribution bar chart */}
          <CategoryDistribution projects={filteredProjects} lang={lang} />
        </TabsContent>

        {/* Ranked projects table */}
        <TabsContent value="projects" className="animate-fade-in-up">
          <ProjectsTable
            projects={filteredProjects}
            lang={lang}
            showSwahili={showSwahili}
            canApprove={cfg.canApprove && !!session}
            onUpdateStatus={updateProjectStatus}
          />
        </TabsContent>

        {/* Map */}
        <TabsContent value="map" className="animate-fade-in-up">
          <Card className="border-border/60 shadow-sm">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-lg">
                <MapIcon className="h-5 w-5 text-primary" />
                {t('tabMap', lang)}
              </CardTitle>
              <CardDescription>
                {lang === 'en'
                  ? 'Ward-level demand intensity — circle size reflects priority score'
                  : 'Madai ya kata — ukubwa wa duara unaonyesha kipaumbele'}
              </CardDescription>
            </CardHeader>
            <CardContent>
              <WardMap projects={filteredProjects} />
            </CardContent>
          </Card>
        </TabsContent>

        {/* Compare */}
        <TabsContent value="compare" className="animate-fade-in-up">
          <CompareView projects={filteredProjects} lang={lang} showSwahili={showSwahili} />
        </TabsContent>
      </Tabs>
    </div>
  );
}

function CategoryDistribution({ projects, lang }: { projects: RankedProject[]; lang: Language }) {
  const counts = new Map<string, number>();
  for (const p of projects) {
    counts.set(p.category, (counts.get(p.category) ?? 0) + p.backing_submissions_count);
  }
  const sorted = Array.from(counts.entries()).sort((a, b) => b[1] - a[1]);
  const max = sorted[0]?.[1] ?? 1;

  return (
    <Card className="mt-6 border-border/60 shadow-sm">
      <CardHeader className="pb-3">
        <CardTitle className="flex items-center gap-2 text-base">
          <BarChart3 className="h-4 w-4 text-primary" />
          {lang === 'en' ? 'Citizen Demand by Category' : 'Madai ya Wananchi kwa Kategoria'}
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-3">
        {sorted.map(([cat, count]) => {
          const Icon = categoryIcon(cat);
          return (
            <div key={cat} className="flex items-center gap-3">
              <div className="flex w-32 shrink-0 items-center gap-1.5">
                <Icon className="h-4 w-4 text-primary" />
                <span className="text-sm font-medium text-foreground">{CATEGORY_LABELS[cat]?.[lang] ?? cat}</span>
              </div>
              <div className="h-6 flex-1 overflow-hidden rounded-lg bg-muted">
                <div
                  className="flex h-full items-center justify-end rounded-lg bg-gradient-to-r from-primary/70 to-primary px-2 text-xs font-semibold text-primary-foreground transition-all"
                  style={{ width: `${Math.max(8, (count / max) * 100)}%` }}
                >
                  {count}
                </div>
              </div>
            </div>
          );
        })}
      </CardContent>
    </Card>
  );
}

function ProjectsTable({
  projects, lang, showSwahili, canApprove, onUpdateStatus,
}: {
  projects: RankedProject[];
  lang: Language;
  showSwahili: boolean;
  canApprove: boolean;
  onUpdateStatus: (id: string, status: ProjectStatus) => void;
}) {
  if (projects.length === 0) {
    return (
      <Card className="border-border/60">
        <CardContent className="py-16 text-center">
          <p className="text-sm text-muted-foreground">{t('noData', lang)}</p>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card className="border-border/60 shadow-sm">
      <CardContent className="p-0">
        <div className="overflow-x-auto">
          <Table>
            <TableHeader>
              <TableRow className="bg-muted/40 hover:bg-muted/40">
                <TableHead className="min-w-[260px]">{t('colProject', lang)}</TableHead>
                <TableHead>{t('colWard', lang)}</TableHead>
                <TableHead>{t('colCategory', lang)}</TableHead>
                <TableHead className="text-center">{t('colPriority', lang)}</TableHead>
                <TableHead className="text-center">{t('colBacking', lang)}</TableHead>
                <TableHead className="text-right">{t('colBeneficiaries', lang)}</TableHead>
                <TableHead className="text-center">{t('colCost', lang)}</TableHead>
                <TableHead className="text-center">{t('colStatus', lang)}</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {projects.map((p) => {
                const Icon = categoryIcon(p.category);
                return (
                  <TableRow key={p.id} className="group">
                    <TableCell>
                      <div className="flex items-start gap-2.5">
                        <div className="mt-0.5 flex h-8 w-8 shrink-0 items-center justify-center rounded-lg bg-primary/10">
                          <Icon className="h-4 w-4 text-primary" />
                        </div>
                        <div className="min-w-0">
                          <p className="font-medium leading-tight text-foreground">{p.title.split(' in ')[0]}</p>
                          <p className={cn('mt-1 text-xs leading-snug', showSwahili ? 'text-muted-foreground' : 'text-muted-foreground/80')}>
                            {showSwahili ? p.justification_sw : p.justification_en}
                          </p>
                          {showSwahili && (
                            <p className="mt-0.5 text-xs leading-snug text-muted-foreground/60">{p.justification_en}</p>
                          )}
                        </div>
                      </div>
                    </TableCell>
                    <TableCell>
                      <div className="text-sm font-medium text-foreground">{p.ward_name}</div>
                      <div className="text-xs text-muted-foreground">{p.county_name}</div>
                    </TableCell>
                    <TableCell><CategoryBadge category={p.category} lang={lang} /></TableCell>
                    <TableCell className="text-center"><ScoreBadge score={p.priority_score} /></TableCell>
                    <TableCell className="text-center">
                      <span className="font-semibold text-foreground">{p.backing_submissions_count}</span>
                    </TableCell>
                    <TableCell className="text-right text-sm text-foreground">
                      {p.beneficiary_count_estimate.toLocaleString()}
                    </TableCell>
                    <TableCell className="text-center"><CostBandBadge band={p.cost_band} /></TableCell>
                    <TableCell>
                      <div className="flex flex-col items-center gap-1.5">
                        <StatusBadge status={p.status} />
                        {canApprove && p.status === 'DRAFT' && (
                          <Button size="sm" variant="ghost" className="h-6 px-2 text-xs" onClick={() => onUpdateStatus(p.id, 'APPROVED')}>
                            <CheckCircle2 className="mr-1 h-3 w-3" />{t('approve', lang)}
                          </Button>
                        )}
                      </div>
                    </TableCell>
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
        </div>
      </CardContent>
    </Card>
  );
}

function CompareView({
  projects, lang, showSwahili,
}: {
  projects: RankedProject[];
  lang: Language;
  showSwahili: boolean;
}) {
  const [selected, setSelected] = useState<string[]>([]);

  const toggleSelect = (id: string) => {
    setSelected((prev) => {
      if (prev.includes(id)) return prev.filter((x) => x !== id);
      if (prev.length >= 3) return [prev[1], prev[2], id];
      return [...prev, id];
    });
  };

  const selectedProjects = selected
    .map((id) => projects.find((p) => p.id === id))
    .filter(Boolean) as RankedProject[];

  if (projects.length < 2) {
    return (
      <Card className="border-border/60">
        <CardContent className="py-16 text-center">
          <p className="text-sm text-muted-foreground">{t('noData', lang)}</p>
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="space-y-6">
      <Card className="border-border/60 shadow-sm">
        <CardHeader>
          <CardTitle className="flex items-center gap-2 text-lg">
            <GitCompare className="h-5 w-5 text-primary" />
            {t('compareTitle', lang)}
          </CardTitle>
          <CardDescription>{t('comparePick', lang)}</CardDescription>
        </CardHeader>
        <CardContent>
          <Select value="" onValueChange={(v) => { if (v) toggleSelect(v); }}>
            <SelectTrigger><SelectValue placeholder={t('selectProjects', lang)} /></SelectTrigger>
            <SelectContent>
              {projects.filter((p) => !selected.includes(p.id)).map((p) => (
                <SelectItem key={p.id} value={p.id}>{p.title}</SelectItem>
              ))}
            </SelectContent>
          </Select>

          {selected.length > 0 && (
            <div className="mt-4 flex flex-wrap gap-2">
              {selectedProjects.map((p) => (
                <div key={p.id} className="flex items-center gap-1.5 rounded-lg border border-border bg-muted/40 px-3 py-1.5 text-sm">
                  <CategoryBadge category={p.category} lang={lang} />
                  <span className="font-medium text-foreground">{p.ward_name}</span>
                  <button onClick={() => toggleSelect(p.id)} className="text-muted-foreground hover:text-destructive">×</button>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>

      {selectedProjects.length >= 2 && (
        <div className={cn('grid gap-4', selectedProjects.length === 2 ? 'sm:grid-cols-2' : 'sm:grid-cols-3')}>
          {selectedProjects.map((p, i) => (
            <ProjectCompareCard key={p.id} project={p} lang={lang} showSwahili={showSwahili} index={i} />
          ))}
        </div>
      )}

      {selectedProjects.length >= 2 && (
        <CompareMatrix projects={selectedProjects} lang={lang} />
      )}
    </div>
  );
}

function ProjectCompareCard({
  project, lang, showSwahili, index,
}: {
  project: RankedProject;
  lang: Language;
  showSwahili: boolean;
  index: number;
}) {
  const Icon = categoryIcon(project.category);
  return (
    <Card className={cn(
      'border-2 shadow-sm transition-all',
      index === 0 ? 'border-primary/40' : 'border-border/60',
    )}>
      <CardContent className="p-5">
        <div className="mb-3 flex items-center justify-between">
          <div className="flex h-10 w-10 items-center justify-center rounded-xl bg-primary/10">
            <Icon className="h-5 w-5 text-primary" />
          </div>
          <ScoreBadge score={project.priority_score} label={t('analysisPriority', lang)} />
        </div>
        <CategoryBadge category={project.category} lang={lang} size="md" />
        <h3 className="mt-2 font-semibold leading-snug text-foreground">{project.title.split(' in ')[0]}</h3>
        <div className="mt-1 flex items-center gap-1 text-sm text-muted-foreground">
          <MapPin className="h-3.5 w-3.5" /> {project.ward_name}, {project.county_name}
        </div>
        <div className="mt-4 space-y-2 text-sm">
          <CompareRow label={t('colBacking', lang)} value={`${project.backing_submissions_count}`} />
          <CompareRow label={t('colBeneficiaries', lang)} value={project.beneficiary_count_estimate.toLocaleString()} />
          <CompareRow label={t('colCost', lang)} value={<CostBandBadge band={project.cost_band} />} />
          <CompareRow label={lang === 'en' ? 'Population' : 'Wakazi'} value={(project.population ?? 0).toLocaleString()} />
          <CompareRow label={lang === 'en' ? 'Voters 2022' : 'Wapigakura 2022'} value={(project.voters ?? 0).toLocaleString()} />
        </div>
        <div className="mt-4 rounded-lg bg-muted/50 p-3">
          <p className="text-xs leading-snug text-muted-foreground">
            {showSwahili ? project.justification_sw : project.justification_en}
          </p>
        </div>
      </CardContent>
    </Card>
  );
}

function CompareRow({ label, value }: { label: string; value: React.ReactNode }) {
  return (
    <div className="flex items-center justify-between">
      <span className="text-muted-foreground">{label}</span>
      <span className="font-semibold text-foreground">{value}</span>
    </div>
  );
}

function CompareMatrix({ projects, lang }: { projects: RankedProject[]; lang: Language }) {
  const metrics: { key: string; label: string; get: (p: RankedProject) => number }[] = [
    { key: 'priority', label: t('colPriority', lang), get: (p) => p.priority_score * 100 },
    { key: 'backing', label: t('colBacking', lang), get: (p) => p.backing_submissions_count },
    { key: 'beneficiaries', label: t('colBeneficiaries', lang), get: (p) => p.beneficiary_count_estimate },
    { key: 'population', label: lang === 'en' ? 'Population' : 'Wakazi', get: (p) => p.population ?? 0 },
  ];

  const bestPerMetric = metrics.map((m) => {
    const values = projects.map(m.get);
    return Math.max(...values);
  });

  return (
    <Card className="border-border/60 shadow-sm">
      <CardHeader className="pb-3">
        <CardTitle className="text-base">{lang === 'en' ? 'Comparison Matrix' : 'Meza ya Ulinganisho'}</CardTitle>
      </CardHeader>
      <CardContent className="p-0">
        <div className="overflow-x-auto">
          <Table>
            <TableHeader>
              <TableRow className="bg-muted/40 hover:bg-muted/40">
                <TableHead>{lang === 'en' ? 'Metric' : 'Kipimo'}</TableHead>
                {projects.map((p) => (
                  <TableHead key={p.id} className="text-center">
                    <div className="flex flex-col items-center gap-1">
                      <CategoryBadge category={p.category} lang={lang} />
                      <span className="text-xs font-medium text-foreground">{p.ward_name}</span>
                    </div>
                  </TableHead>
                ))}
              </TableRow>
            </TableHeader>
            <TableBody>
              {metrics.map((m, mi) => (
                <TableRow key={m.key}>
                  <TableCell className="font-medium text-foreground">{m.label}</TableCell>
                  {projects.map((p) => {
                    const val = m.get(p);
                    const isBest = val === bestPerMetric[mi] && val > 0;
                    return (
                      <TableCell key={p.id} className="text-center">
                        <span className={cn(
                          'inline-flex items-center rounded-lg px-2.5 py-1 text-sm font-semibold',
                          isBest ? 'bg-success/15 text-success' : 'text-foreground',
                        )}>
                          {m.key === 'priority' ? `${Math.round(val)}%` : val.toLocaleString()}
                          {isBest && <CheckCircle2 className="ml-1 h-3.5 w-3.5" />}
                        </span>
                      </TableCell>
                    );
                  })}
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </div>
      </CardContent>
    </Card>
  );
}

function CitizenDashboard({ lang, profile }: { lang: Language; profile: { full_name: string; role: string } | null }) {
  const { wards } = useAreas();
  const [mySubs, setMySubs] = useState<Submission[]>([]);
  const [allSubs, setAllSubs] = useState<Submission[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    (async () => {
      const { data: all } = await supabase
        .from('submissions')
        .select('id, title, description, status, created_at, category_input, ward_id, estimated_beneficiaries_input, wards:ward_id(name, county_id, counties:county_id(name)), submission_analysis:submission_analysis(category, priority_score, summary_en, summary_sw, language_detected, duplicate_group_id)')
        .order('created_at', { ascending: false });
      setAllSubs((all ?? []) as unknown as Submission[]);
      setMySubs((all ?? []).slice(0, 5) as unknown as Submission[]);
      setLoading(false);
    })();
  }, []);

  const stats = {
    total: allSubs.length,
    analyzed: allSubs.filter((s) => s.status === 'ANALYZED').length,
    pending: allSubs.filter((s) => s.status === 'PENDING_AI').length,
  };

  if (loading) {
    return (
      <div className="flex min-h-[60vh] items-center justify-center">
        <Loader2 className="h-8 w-8 animate-spin text-primary" />
      </div>
    );
  }

  return (
    <div className="mx-auto max-w-5xl px-4 py-8 sm:px-6 lg:px-8">
      <div className="mb-6">
        <div className="mb-2 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
          <UserCircle2 className="h-3.5 w-3.5" />
          {profile ? `${profile.full_name}` : (lang === 'en' ? 'Citizen' : 'Mwananchi')}
        </div>
        <h1 className="text-2xl font-bold tracking-tight text-foreground sm:text-3xl">{t('dashCitizen' as never, lang)}</h1>
        <p className="mt-1 text-sm text-muted-foreground">{t('dashCitizenSub' as never, lang)}</p>
      </div>

      <div className="mb-6 grid grid-cols-3 gap-4">
        <Card className="border-border/60 shadow-sm">
          <CardContent className="p-4">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-blue-50 text-blue-600">
              <Inbox className="h-5 w-5" />
            </div>
            <div className="mt-2 text-xl font-bold text-foreground">{stats.total}</div>
            <div className="text-xs text-muted-foreground">{lang === 'en' ? 'Total requests' : 'Maombi yote'}</div>
          </CardContent>
        </Card>
        <Card className="border-border/60 shadow-sm">
          <CardContent className="p-4">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-green-50 text-green-600">
              <CheckCircle2 className="h-5 w-5" />
            </div>
            <div className="mt-2 text-xl font-bold text-foreground">{stats.analyzed}</div>
            <div className="text-xs text-muted-foreground">{lang === 'en' ? 'Analyzed' : 'Yamechambuliwa'}</div>
          </CardContent>
        </Card>
        <Card className="border-border/60 shadow-sm">
          <CardContent className="p-4">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-amber-50 text-amber-600">
              <Clock className="h-5 w-5" />
            </div>
            <div className="mt-2 text-xl font-bold text-foreground">{stats.pending}</div>
            <div className="text-xs text-muted-foreground">{lang === 'en' ? 'Pending' : 'Inasubiri'}</div>
          </CardContent>
        </Card>
      </div>

      <Card className="mb-6 border-primary/30 bg-primary/5 shadow-sm">
        <CardContent className="flex items-center justify-between p-5">
          <div>
            <h3 className="font-semibold text-foreground">{t('mySubsNewReq' as never, lang)}</h3>
            <p className="text-sm text-muted-foreground">{t('submitSubtitle', lang)}</p>
          </div>
          <Button asChild>
            <Link to="/submit"><Plus className="h-4 w-4" />{t('btnSubmit', lang)}</Link>
          </Button>
        </CardContent>
      </Card>

      <Card className="border-border/60 shadow-sm">
        <CardHeader className="pb-3">
          <CardTitle className="flex items-center gap-2 text-base">
            <Inbox className="h-4 w-4 text-primary" />
            {t('mySubsTitle' as never, lang)}
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-3">
          {mySubs.length === 0 && (
            <div className="py-12 text-center">
              <Inbox className="mx-auto h-10 w-10 text-muted-foreground/40" />
              <p className="mt-3 text-sm text-muted-foreground">{t('mySubsEmpty' as never, lang)}</p>
              <Button asChild variant="outline" size="sm" className="mt-3">
                <Link to="/submit">{t('mySubsNewReq' as never, lang)}</Link>
              </Button>
            </div>
          )}
          {mySubs.map((s) => {
            const an = s.submission_analysis;
            const Icon = an ? categoryIcon(an.category) : null;
            const wardName = wardNameById(wards, s.ward_id);
            const countyName = (s.wards as unknown as { counties?: { name: string } })?.counties?.name ?? '';
            return (
              <div key={s.id} className="flex items-start gap-3 rounded-lg border border-border/50 p-4 transition-colors hover:bg-muted/30">
                {Icon ? <Icon className="mt-0.5 h-5 w-5 shrink-0 text-primary" /> : <Clock className="mt-0.5 h-5 w-5 shrink-0 text-muted-foreground" />}
                <div className="min-w-0 flex-1">
                  <div className="flex items-start justify-between gap-2">
                    <p className="font-medium text-foreground">{s.title || (an ? an.sub_category : s.category_input)}</p>
                    <StatusBadge status={s.status} />
                  </div>
                  <p className="mt-1 line-clamp-2 text-sm text-muted-foreground">{s.description}</p>
                  <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
                    <span className="inline-flex items-center gap-1"><MapPin className="h-3 w-3" />{wardName}{countyName && `, ${countyName}`}</span>
                    {an && <ScoreBadge score={an.priority_score} />}
                  </div>
                  {an && (
                    <p className="mt-2 rounded-lg bg-muted/50 p-2 text-xs text-muted-foreground">
                      {an.language_detected === 'sw' ? an.summary_sw : an.summary_en}
                    </p>
                  )}
                </div>
              </div>
            );
          })}
        </CardContent>
      </Card>

      <div className="mt-4 text-center">
        <Link to="/submit" className="inline-flex items-center gap-1 text-sm font-medium text-primary hover:underline">
          {t('backToPortal' as never, lang)}
        </Link>
      </div>
    </div>
  );
}
