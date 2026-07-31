import { Link } from 'react-router-dom';
import {
  Landmark, ArrowRight, MapPin, Mic, BarChart3, CheckCircle2,
  UserCircle2, Users, ClipboardList, ShieldCheck,
} from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { t } from '@/lib/i18n';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';

const HERO_IMAGE = '/images/hero_image.jpg';
const SECTION_IMAGE_1 = '/images/citizens_image.jpg';
const SECTION_IMAGE_2 = '/images/kenya_map.jpg';
const SECTION_IMAGE_3 = '/images/parliament_image.jpg';

const FEATURES = [
  { icon: Mic, key: 'feat1', img: SECTION_IMAGE_1 },
  { icon: BarChart3, key: 'feat2', img: SECTION_IMAGE_2 },
  { icon: CheckCircle2, key: 'feat3', img: SECTION_IMAGE_3 },
] as const;

const ROLE_CARDS = [
  { icon: UserCircle2, titleKey: 'roleCitizenTitle', descKey: 'roleCitizenDesc', color: 'text-blue-600 bg-blue-50' },
  { icon: Landmark, titleKey: 'roleMPTitle', descKey: 'roleMPDesc', color: 'text-primary bg-primary/10' },
  { icon: Users, titleKey: 'roleAnalystTitle', descKey: 'roleAnalystDesc', color: 'text-accent bg-accent/10' },
  { icon: ClipboardList, titleKey: 'roleCDFTitle', descKey: 'roleCDFDesc', color: 'text-success bg-success/10' },
] as const;

export function LandingPage() {
  const { lang } = useLang();

  return (
    <div className="flex min-h-[calc(100vh-4rem)] flex-col">
      {/* Hero */}
      <section className="relative flex items-center overflow-hidden">
        <div className="absolute inset-0">
          <img
            src={HERO_IMAGE}
            alt="Kenya Flag"
            className="h-full w-full object-cover"
          />
          <div className="absolute inset-0 bg-gradient-to-r from-background/95 via-background/80 to-background/40" />
          <div className="absolute inset-0 bg-gradient-to-t from-background via-transparent to-transparent" />
        </div>

        <div className="relative mx-auto w-full max-w-7xl px-4 py-20 sm:px-6 lg:px-8 lg:py-32">
          <div className="max-w-2xl">
            <div className="mb-5 inline-flex items-center gap-2 rounded-full border border-primary/30 bg-primary/10 px-4 py-1.5 text-xs font-semibold text-primary backdrop-blur-sm">
              <ShieldCheck className="h-3.5 w-3.5" />
              {t('heroBadge', lang)}
            </div>
            <h1 className="text-4xl font-bold leading-tight tracking-tight text-foreground sm:text-5xl lg:text-6xl">
              {t('heroTitle', lang)}
            </h1>
            <p className="mt-5 max-w-xl text-base text-muted-foreground sm:text-lg">
              {t('heroSubtitle', lang)}
            </p>
            <div className="mt-8 flex flex-wrap gap-3">
              <Button asChild size="lg" className="group">
                <Link to="/submit">
                  {t('heroCta', lang)}
                  <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
                </Link>
              </Button>
              <Button asChild variant="outline" size="lg">
                <Link to="/auth">{t('heroCta2', lang)}</Link>
              </Button>
            </div>

            <div className="mt-12 grid grid-cols-3 gap-4 sm:gap-8">
              {[
                { value: '27', labelKey: 'heroStatWards' },
                { value: '20+', labelKey: 'heroStatSubs' },
                { value: '13', labelKey: 'heroStatProjects' },
              ].map((s) => (
                <div key={s.labelKey}>
                  <div className="text-2xl font-bold text-foreground sm:text-3xl">{s.value}</div>
                  <div className="text-xs text-muted-foreground sm:text-sm">{t(s.labelKey as never, lang)}</div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      {/* Features */}
      <section className="bg-muted/30 py-20 lg:py-28">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl">
              {t('featuresTitle', lang)}
            </h2>
            <p className="mt-3 text-muted-foreground">{t('featuresSubtitle', lang)}</p>
          </div>

          <div className="mt-14 grid gap-8 md:grid-cols-3">
            {FEATURES.map((f, i) => (
              <Card key={f.key} className="group overflow-hidden border-border/60 shadow-sm transition-shadow hover:shadow-md">
                <div className="relative h-52 overflow-hidden">
                  <img
                    src={f.img}
                    alt={t(`${f.key}Title` as never, lang)}
                    className="h-full w-full object-cover transition-transform duration-500 group-hover:scale-105"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-background/80 to-transparent" />
                  <div className="absolute bottom-3 left-4 flex h-10 w-10 items-center justify-center rounded-xl bg-primary text-primary-foreground shadow-lg">
                    <f.icon className="h-5 w-5" />
                  </div>
                </div>
                <CardContent className="p-6">
                  <div className="mb-2 flex items-center gap-2">
                    <span className="text-xs font-bold text-primary">0{i + 1}</span>
                    <h3 className="font-semibold text-foreground">{t(`${f.key}Title` as never, lang)}</h3>
                  </div>
                  <p className="text-sm text-muted-foreground">{t(`${f.key}Desc` as never, lang)}</p>
                  {i === 0 && (
                    <div className="mt-4 flex flex-wrap gap-2">
                      <span className="inline-flex items-center gap-1 rounded-full bg-blue-50 px-2.5 py-0.5 text-xs font-medium text-blue-700">
                        <MapPin className="h-3 w-3" />Ward-level
                      </span>
                      <span className="inline-flex items-center gap-1 rounded-full bg-green-50 px-2.5 py-0.5 text-xs font-medium text-green-700">
                        <Mic className="h-3 w-3" />Voice & photo
                      </span>
                    </div>
                  )}
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* Roles */}
      <section className="py-20 lg:py-28">
        <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
          <div className="mx-auto max-w-2xl text-center">
            <h2 className="text-3xl font-bold tracking-tight text-foreground sm:text-4xl">
              {t('rolesTitle', lang)}
            </h2>
            <p className="mt-3 text-muted-foreground">{t('rolesSubtitle', lang)}</p>
          </div>

          <div className="mt-14 grid gap-6 sm:grid-cols-2 lg:grid-cols-4">
            {ROLE_CARDS.map((r) => (
              <Card key={r.titleKey} className="border-border/60 shadow-sm transition-all hover:border-primary/30 hover:shadow-md">
                <CardContent className="p-6 text-center">
                  <div className={`mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-2xl ${r.color}`}>
                    <r.icon className="h-7 w-7" />
                  </div>
                  <h3 className="font-semibold text-foreground">{t(r.titleKey as never, lang)}</h3>
                  <p className="mt-2 text-sm text-muted-foreground">{t(r.descKey as never, lang)}</p>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="bg-primary py-20 lg:py-28">
        <div className="mx-auto max-w-4xl px-4 text-center sm:px-6 lg:px-8">
          <h2 className="text-3xl font-bold tracking-tight text-primary-foreground sm:text-4xl">
            {t('ctaTitle', lang)}
          </h2>
          <p className="mt-4 text-primary-foreground/80">{t('ctaSubtitle', lang)}</p>
          <Button asChild size="lg" variant="secondary" className="mt-8 group">
            <Link to="/auth">
              {t('ctaButton', lang)}
              <ArrowRight className="ml-2 h-4 w-4 transition-transform group-hover:translate-x-1" />
            </Link>
          </Button>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-border bg-background py-10">
        <div className="mx-auto flex max-w-7xl flex-col items-center gap-4 px-4 text-center sm:px-6 lg:px-8">
          <Link to="/" className="flex items-center gap-2.5">
            <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-primary text-primary-foreground">
              <Landmark className="h-4 w-4" />
            </div>
            <span className="font-bold text-foreground">Jakamoyo</span>
          </Link>
          <p className="text-sm text-muted-foreground">{t('footerBuilt', lang)}</p>
          <p className="text-xs text-muted-foreground/70">{t('footerRights', lang)}</p>
        </div>
      </footer>
    </div>
  );
}
