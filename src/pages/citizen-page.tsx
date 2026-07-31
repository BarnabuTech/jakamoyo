import { useState, useMemo, useCallback, useEffect } from 'react';
import { Link } from 'react-router-dom';
import {
  Send, Camera, Mic, MapPin, Users, Sparkles, CheckCircle2,
  Loader2, AlertCircle, ArrowRight, Clock,
} from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { useAreas, wardNameById } from '@/lib/areas';
import { t, CATEGORY_INPUTS } from '@/lib/i18n';
import { supabase, callEdge } from '@/lib/supabase';
import type { Submission, SubmissionAnalysis, AnalyzeResponse, Language } from '@/lib/types';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Textarea } from '@/components/ui/textarea';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import {
  Select, SelectContent, SelectItem, SelectTrigger, SelectValue,
} from '@/components/ui/select';
import { CategoryBadge, categoryIcon } from '@/components/shared/category-badge';
import { ScoreBadge } from '@/components/shared/score-badge';
import { toast } from 'sonner';
import { cn } from '@/lib/utils';

const CAT_LABEL: Record<string, { en: string; sw: string }> = {
  Roads: { en: 'Roads', sw: 'Barabara' },
  Schools: { en: 'Schools', sw: 'Shule' },
  Health: { en: 'Health', sw: 'Afya' },
  Water: { en: 'Water', sw: 'Maji' },
  Youth: { en: 'Youth', sw: 'Vijana' },
  Agriculture: { en: 'Agriculture', sw: 'Kilimo' },
  ICT: { en: 'ICT', sw: 'ICT' },
  Market: { en: 'Market', sw: 'Soko' },
  Other: { en: 'Other', sw: 'Nyingine' },
};

export function CitizenPage() {
  const { lang } = useLang();
  const {
    counties,
    constituencies,
    wards,
    loading: areasLoading,
    error: areasError,
    constituenciesForCounty,
    wardsForConstituency,
  } = useAreas();

  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [countyId, setCountyId] = useState('');
  const [constituencyId, setConstituencyId] = useState('');
  const [wardId, setWardId] = useState('');
  const [category, setCategory] = useState('');
  const [beneficiaries, setBeneficiaries] = useState('');
  const [photoPreview, setPhotoPreview] = useState<string | null>(null);
  const [audioName, setAudioName] = useState<string | null>(null);

  const [submitting, setSubmitting] = useState(false);
  const [analyzing, setAnalyzing] = useState(false);
  const [analysis, setAnalysis] = useState<SubmissionAnalysis | null>(null);
  const [submittedId, setSubmittedId] = useState<string | null>(null);
  const [recent, setRecent] = useState<Submission[]>([]);

  const filteredConstituencies = useMemo(
    () => (countyId ? constituenciesForCounty(countyId) : []),
    [countyId, constituencies, constituenciesForCounty],
  );
  const filteredWards = useMemo(
    () => (constituencyId ? wardsForConstituency(constituencyId) : []),
    [constituencyId, wards, wardsForConstituency],
  );

  const canSubmit = description.trim().length > 10 && wardId && category && !submitting;

  const loadRecent = useCallback(async () => {
    const { data } = await supabase
      .from('submissions')
      .select('id, title, description, status, created_at, category_input, ward_id, wards:ward_id(name), submission_analysis:submission_analysis(category, priority_score, summary_en, summary_sw)')
      .order('created_at', { ascending: false })
      .limit(6);
    if (data) setRecent(data as unknown as Submission[]);
  }, []);

  useEffect(() => { loadRecent(); }, [loadRecent]);

  const handlePhoto = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    if (file.size > 1_500_000) {
      toast.error(lang === 'en' ? 'Photo too large (max 1.5 MB)' : 'Picha kubwa mno (max 1.5 MB)');
      return;
    }
    const reader = new FileReader();
    reader.onload = () => setPhotoPreview(reader.result as string);
    reader.readAsDataURL(file);
  };

  const handleAudio = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setAudioName(file.name);
  };

  const resetForm = () => {
    setTitle(''); setDescription(''); setCountyId(''); setConstituencyId('');
    setWardId(''); setCategory(''); setBeneficiaries('');
    setPhotoPreview(null); setAudioName(null);
    setAnalysis(null); setSubmittedId(null);
  };

  const handleSubmit = async () => {
    if (!canSubmit) return;
    setSubmitting(true);
    setAnalyzing(true);
    setAnalysis(null);
    try {
      const { data, error } = await supabase.from('submissions').insert({
        title: title || null,
        description,
        language: lang,
        county_id: countyId || null,
        constituency_id: constituencyId || null,
        ward_id: wardId,
        category_input: category,
        estimated_beneficiaries_input: beneficiaries || null,
        photo_data: photoPreview,
        audio_meta: audioName ? { name: audioName } : null,
        status: 'PENDING_AI',
      }).select('id').single();

      if (error || !data) {
        toast.error(t('error', lang));
        setAnalyzing(false);
        return;
      }

      const newId = data.id;
      setSubmittedId(newId);

      // Trigger AI analysis via edge function
      try {
        const result = await callEdge<AnalyzeResponse>('analyze-submission', {
          method: 'POST',
          searchParams: { id: newId },
        });
        // Fetch the persisted analysis
        const { data: aData } = await supabase
          .from('submission_analysis')
          .select('*')
          .eq('submission_id', newId)
          .maybeSingle();
        if (aData) setAnalysis(aData as SubmissionAnalysis);
        toast.success(t('submittedSuccess', lang));
      } catch (err) {
        // Edge function may fail in sandbox; still confirm submission
        toast.success(lang === 'en' ? 'Request submitted. AI analysis pending.' : 'Ombi limewasilishwa. Uchambuzi wa AI unaendelea.');
      }

      loadRecent();
    } catch (err) {
      toast.error(t('error', lang));
    } finally {
      setSubmitting(false);
      setAnalyzing(false);
    }
  };

  const analysisLang: Language = analysis?.language_detected ?? lang;

  return (
    <div className="mx-auto max-w-7xl px-4 py-8 sm:px-6 lg:px-8">
      {/* Hero */}
      <div className="mb-8 max-w-2xl animate-fade-in-up">
        <div className="mb-3 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
          <Sparkles className="h-3.5 w-3.5" />
          {t('poweredBy', lang)}
        </div>
        <h1 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl">
          {t('subPortal', lang)}
        </h1>
        <p className="mt-2 text-base text-muted-foreground">
          {t('submitSubtitle', lang)}
        </p>
      </div>

      <div className="grid gap-6 lg:grid-cols-5">
        {/* Form column */}
        <div className="lg:col-span-3">
          <Card className="border-border/60 shadow-sm">
            <CardHeader>
              <CardTitle className="flex items-center gap-2 text-xl">
                <Send className="h-5 w-5 text-primary" />
                {t('submitTitle', lang)}
              </CardTitle>
              <CardDescription>{t('submitSubtitle', lang)}</CardDescription>
            </CardHeader>
            <CardContent className="space-y-5">
              {/* Title */}
              <div className="space-y-1.5">
                <Label htmlFor="title">{t('fieldTitle', lang)}</Label>
                <Input
                  id="title"
                  value={title}
                  onChange={(e) => setTitle(e.target.value)}
                  placeholder={lang === 'en' ? 'e.g. Kawangware road drainage' : 'K.m. Mifereji ya Kawangware'}
                />
              </div>

              {/* Description */}
              <div className="space-y-1.5">
                <Label htmlFor="description">
                  {t('fieldDescription', lang)} <span className="text-destructive">*</span>
                </Label>
                <Textarea
                  id="description"
                  value={description}
                  onChange={(e) => setDescription(e.target.value)}
                  placeholder={t('fieldDescriptionPh', lang)}
                  rows={5}
                  className="resize-none"
                />
                <p className="text-xs text-muted-foreground">
                  {description.length} {lang === 'en' ? 'characters' : 'herufi'}
                </p>
              </div>

              {/* County / Constituency / Ward */}
              <div className="grid gap-4 sm:grid-cols-3">
                <div className="space-y-1.5">
                  <Label className="flex items-center gap-1"><MapPin className="h-3.5 w-3.5 text-primary" />{t('fieldCounty', lang)}</Label>
                  <Select value={countyId} onValueChange={(v) => { setCountyId(v); setConstituencyId(''); setWardId(''); }} disabled={areasLoading || Boolean(areasError)}>
                    <SelectTrigger><SelectValue placeholder={t('selectCounty', lang)} /></SelectTrigger>
                    <SelectContent>
                      {counties.map((c) => <SelectItem key={c.id} value={c.id}>{c.name}</SelectItem>)}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-1.5">
                  <Label>{t('fieldConstituency', lang)}</Label>
                  <Select value={constituencyId} onValueChange={(v) => { setConstituencyId(v); setWardId(''); }} disabled={!countyId}>
                    <SelectTrigger><SelectValue placeholder={t('selectConstituency', lang)} /></SelectTrigger>
                    <SelectContent>
                      {filteredConstituencies.map((c) => <SelectItem key={c.id} value={c.id}>{c.name}</SelectItem>)}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-1.5">
                  <Label>{t('fieldWard', lang)} <span className="text-destructive">*</span></Label>
                  <Select value={wardId} onValueChange={setWardId} disabled={!constituencyId}>
                    <SelectTrigger><SelectValue placeholder={t('selectWard', lang)} /></SelectTrigger>
                    <SelectContent>
                      {filteredWards.map((w) => <SelectItem key={w.id} value={w.id}>{w.name}</SelectItem>)}
                    </SelectContent>
                  </Select>
                </div>
              </div>
              {areasLoading && <p className="text-xs text-muted-foreground">Loading counties, constituencies, and wards…</p>}
              {areasError && <p role="alert" className="text-xs text-destructive">Unable to load locations: {areasError}</p>}

              {/* Category + Beneficiaries */}
              <div className="grid gap-4 sm:grid-cols-2">
                <div className="space-y-1.5">
                  <Label>{t('fieldCategory', lang)} <span className="text-destructive">*</span></Label>
                  <Select value={category} onValueChange={setCategory}>
                    <SelectTrigger><SelectValue placeholder={t('selectCategory', lang)} /></SelectTrigger>
                    <SelectContent>
                      {CATEGORY_INPUTS.map((c) => (
                        <SelectItem key={c} value={c}>{CAT_LABEL[c][lang]}</SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-1.5">
                  <Label className="flex items-center gap-1"><Users className="h-3.5 w-3.5 text-primary" />{t('fieldBeneficiaries', lang)}</Label>
                  <Input
                    value={beneficiaries}
                    onChange={(e) => setBeneficiaries(e.target.value)}
                    placeholder={t('fieldBeneficiariesPh', lang)}
                    inputMode="numeric"
                  />
                </div>
              </div>

              {/* Photo + Audio */}
              <div className="grid gap-4 sm:grid-cols-2">
                <div className="space-y-1.5">
                  <Label className="flex items-center gap-1"><Camera className="h-3.5 w-3.5 text-primary" />{t('fieldPhoto', lang)}</Label>
                  <div className="flex items-center gap-3">
                    <label className="flex h-20 w-20 cursor-pointer items-center justify-center rounded-lg border-2 border-dashed border-border bg-muted/40 transition-colors hover:border-primary hover:bg-primary/5">
                      <input type="file" accept="image/jpeg,image/png" className="hidden" onChange={handlePhoto} />
                      <Camera className="h-6 w-6 text-muted-foreground" />
                    </label>
                    {photoPreview && (
                      <div className="relative">
                        <img src={photoPreview} alt="preview" className="h-20 w-20 rounded-lg object-cover" />
                        <button onClick={() => setPhotoPreview(null)} className="absolute -right-1.5 -top-1.5 flex h-5 w-5 items-center justify-center rounded-full bg-destructive text-destructive-foreground text-xs">×</button>
                      </div>
                    )}
                  </div>
                </div>
                <div className="space-y-1.5">
                  <Label className="flex items-center gap-1"><Mic className="h-3.5 w-3.5 text-primary" />{t('fieldAudio', lang)}</Label>
                  <label className="flex h-20 cursor-pointer items-center justify-center gap-2 rounded-lg border-2 border-dashed border-border bg-muted/40 transition-colors hover:border-primary hover:bg-primary/5">
                    <input type="file" accept="audio/mpeg,audio/wav,audio/mp3" className="hidden" onChange={handleAudio} />
                    <Mic className="h-5 w-5 text-muted-foreground" />
                    <span className="text-xs text-muted-foreground">{audioName ?? (lang === 'en' ? 'Tap to record / upload' : 'Bonyeza kurekodi / pakia')}</span>
                  </label>
                </div>
              </div>

              {/* Submit */}
              <div className="flex flex-col gap-3 pt-2">
                <Button
                  onClick={handleSubmit}
                  disabled={!canSubmit}
                  size="lg"
                  className="w-full bg-primary text-primary-foreground shadow-sm transition-all hover:bg-primary/90 hover:shadow"
                >
                  {submitting ? (
                    <><Loader2 className="h-4 w-4 animate-spin" />{t('btnSubmitting', lang)}</>
                  ) : (
                    <><Send className="h-4 w-4" />{t('btnSubmit', lang)}</>
                  )}
                </Button>
                {!canSubmit && !submitting && description.trim().length <= 10 && (
                  <p className="text-center text-xs text-muted-foreground">
                    {lang === 'en' ? 'Describe your request (min 10 characters)' : 'Eleza ombi lako (angalau herufi 10)'}
                  </p>
                )}
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Analysis + Recent column */}
        <div className="lg:col-span-2 space-y-6">
          {/* AI Analysis result */}
          {analyzing && (
            <Card className="border-primary/30 shadow-sm">
              <CardContent className="flex items-center gap-3 py-6">
                <div className="flex h-12 w-12 items-center justify-center rounded-xl bg-primary/10 animate-pulse-ring">
                  <Sparkles className="h-6 w-6 text-primary" />
                </div>
                <div>
                  <p className="font-semibold text-foreground">{t('btnAnalyzing', lang)}</p>
                  <p className="text-sm text-muted-foreground">{t('poweredBy', lang)}</p>
                </div>
              </CardContent>
            </Card>
          )}

          {analysis && !analyzing && (
            <Card className="border-primary/30 shadow-sm animate-fade-in-up">
              <CardHeader className="pb-3">
                <div className="flex items-center justify-between">
                  <CardTitle className="flex items-center gap-2 text-lg">
                    <CheckCircle2 className="h-5 w-5 text-success" />
                    {t('analysisTitle', lang)}
                  </CardTitle>
                  <span className="rounded-full bg-primary/10 px-2 py-0.5 text-[10px] font-bold uppercase tracking-wide text-primary">
                    {analysis.source === 'gemma4' ? 'Gemma 4' : 'AI'}
                  </span>
                </div>
              </CardHeader>
              <CardContent className="space-y-3">
                <div className="flex flex-wrap items-center gap-2">
                  <CategoryBadge category={analysis.category} lang={analysisLang} size="md" />
                  <ScoreBadge score={analysis.priority_score} label={t('analysisPriority', analysisLang)} />
                </div>
                <p className="text-sm text-foreground">
                  {analysisLang === 'sw' ? analysis.summary_sw : analysis.summary_en}
                </p>
                <div className="grid grid-cols-2 gap-2 text-xs">
                  <div className="rounded-lg bg-muted/50 p-2.5">
                    <div className="text-muted-foreground">{t('analysisLanguage', lang)}</div>
                    <div className="font-semibold text-foreground">{analysis.language_detected === 'sw' ? 'Kiswahili' : 'English'}</div>
                  </div>
                  <div className="rounded-lg bg-muted/50 p-2.5">
                    <div className="text-muted-foreground">{t('analysisBeneficiaries', lang)}</div>
                    <div className="font-semibold text-foreground">{analysis.beneficiary_group}</div>
                  </div>
                </div>
                {analysis.location_entities.length > 0 && (
                  <div className="flex flex-wrap gap-1.5 pt-1">
                    {analysis.location_entities.map((loc, i) => (
                      <span key={i} className="inline-flex items-center gap-1 rounded-full bg-muted px-2 py-0.5 text-xs text-muted-foreground">
                        <MapPin className="h-3 w-3" />{loc}
                      </span>
                    ))}
                  </div>
                )}
                {analysis.duplicate_group_id && (
                  <div className="flex items-center gap-1.5 rounded-lg bg-warning/10 px-3 py-2 text-xs font-medium text-warning">
                    <AlertCircle className="h-3.5 w-3.5" />
                    {t('analysisDuplicate', lang)}
                  </div>
                )}
                <Button variant="outline" size="sm" className="w-full" onClick={resetForm}>
                  {lang === 'en' ? 'Submit another request' : 'Wasilisha ombi jingine'}
                </Button>
              </CardContent>
            </Card>
          )}

          {/* Recent submissions */}
          <Card className="border-border/60 shadow-sm">
            <CardHeader className="pb-3">
              <CardTitle className="text-base">{t('recentSubs', lang)}</CardTitle>
            </CardHeader>
            <CardContent className="space-y-2.5">
              {recent.length === 0 && (
                <p className="py-4 text-center text-sm text-muted-foreground">{t('noData', lang)}</p>
              )}
              {recent.map((s) => {
                const an = s.submission_analysis;
                const Icon = an ? categoryIcon(an.category) : null;
                return (
                  <div key={s.id} className="flex items-start gap-3 rounded-lg border border-border/50 p-3 transition-colors hover:bg-muted/30">
                    {Icon ? <Icon className="mt-0.5 h-4 w-4 shrink-0 text-primary" /> : <Clock className="mt-0.5 h-4 w-4 shrink-0 text-muted-foreground" />}
                    <div className="min-w-0 flex-1">
                      <p className="truncate text-sm font-medium text-foreground">
                        {s.title || (an ? an.sub_category : s.category_input)}
                      </p>
                      <p className="truncate text-xs text-muted-foreground">
                        {wardNameById(wards, s.ward_id)} · {s.category_input}
                      </p>
                      {an && (
                        <div className="mt-1 flex items-center gap-1.5">
                          <ScoreBadge score={an.priority_score} />
                        </div>
                      )}
                    </div>
                  </div>
                );
              })}
              <Link to="/dashboard/mp" className="flex items-center justify-center gap-1 pt-1 text-sm font-medium text-primary hover:underline">
                {t('viewAll', lang)} <ArrowRight className="h-3.5 w-3.5" />
              </Link>
            </CardContent>
          </Card>
        </div>
      </div>
    </div>
  );
}
