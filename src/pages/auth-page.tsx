import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import {
  Landmark, Loader2,  UserCircle2, Microscope, ClipboardList,
  ArrowLeft, type LucideIcon,
} from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { useAuth } from '@/lib/auth-context';
import { t } from '@/lib/i18n';
import type { UserRole } from '@/lib/types';
import { ROLE_META, roleRoute } from '@/lib/types';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
// import { LanguageToggle } from '@/components/shared/language-toggle'; // ShieldCheck,
import { toast } from 'sonner';
import { cn } from '@/lib/utils';

const ROLE_ICONS: Record<string, LucideIcon> = {
  UserCircle2,
  Landmark,
  Microscope,
  ClipboardList,
};

export function AuthPage() {
  const { lang } = useLang();
  const { signIn, signUp } = useAuth();
  const navigate = useNavigate();

  const [mode, setMode] = useState<'in' | 'up'>('in');
  const [selectedRole, setSelectedRole] = useState<UserRole | null>(null);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [name, setName] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!selectedRole) return;
    setLoading(true);
    try {
      if (mode === 'in') {
        const { error } = await signIn(email, password);
        if (error) {
          toast.error(error);
        } else {
          toast.success(lang === 'en' ? 'Signed in' : 'Umeingia');
          navigate(roleRoute(selectedRole));
        }
      } else {
        if (name.trim().length < 2) {
          toast.error(lang === 'en' ? 'Enter your name' : 'Weka jina lako');
          setLoading(false);
          return;
        }
        const { error } = await signUp(email, password, name, selectedRole);
        if (error) {
          toast.error(error);
        } else {
          toast.success(lang === 'en' ? 'Account created — signed in' : 'Akaunti imetengenezwa — umeingia');
          navigate(roleRoute(selectedRole));
        }
      }
    } finally {
      setLoading(false);
    }
  };

  const switchMode = () => {
    setMode(mode === 'in' ? 'up' : 'in');
    setSelectedRole(null);
  };

  return (
    <div className="flex min-h-[calc(100vh-4rem)] items-center justify-center px-4 py-12">
      <div className="w-full max-w-md">
        {!selectedRole ? (
          /* Role selection */
          <Card className="shadow-md animate-fade-in-up">
            <CardHeader>
              <CardTitle className="text-xl">
                {mode === 'in' ? t('authSignInAs', lang) : t('authSignUpAs', lang)}
              </CardTitle>
              <CardDescription>{t('authChooseRole', lang)}</CardDescription>
            </CardHeader>
            <CardContent className="space-y-3">
              {ROLE_META.map((r) => {
                const Icon = ROLE_ICONS[r.icon];
                return (
                  <button
                    key={r.value}
                    onClick={() => setSelectedRole(r.value)}
                    className="flex w-full items-center gap-3.5 rounded-xl border border-border bg-card p-4 text-left transition-all hover:border-primary/40 hover:bg-primary/5 hover:shadow-sm"
                  >
                    <div className={cn('flex h-12 w-12 shrink-0 items-center justify-center rounded-xl', r.color)}>
                      <Icon className="h-6 w-6" />
                    </div>
                    <div className="min-w-0 flex-1">
                      <p className="font-semibold text-foreground">{lang === 'en' ? r.en : r.sw}</p>
                      <p className="text-xs text-muted-foreground">{lang === 'en' ? r.descEn : r.descSw}</p>
                    </div>
                  </button>
                );
              })}
              <button
                onClick={switchMode}
                className="mt-2 w-full text-center text-sm text-muted-foreground hover:text-primary"
              >
                {mode === 'in' ? t('authToggleUp', lang) : t('authToggleIn', lang)}
              </button>
            </CardContent>
          </Card>
        ) : (
          /* Credential form for selected role */
          <Card className="shadow-md animate-fade-in-up">
            <CardHeader>
              <button
                onClick={() => setSelectedRole(null)}
                className="mb-1 inline-flex items-center gap-1 text-sm text-muted-foreground hover:text-primary"
              >
                <ArrowLeft className="h-3.5 w-3.5" />
                {t('authBackToRoles', lang)}
              </button>
              <CardTitle className="text-xl">
                {mode === 'in' ? t('authSignInAs', lang) : t('authSignUpAs', lang)}{' '}
                {lang === 'en' ? ROLE_META.find((r) => r.value === selectedRole)?.en : ROLE_META.find((r) => r.value === selectedRole)?.sw}
              </CardTitle>
              <CardDescription>
                {lang === 'en'
                  ? ROLE_META.find((r) => r.value === selectedRole)?.descEn
                  : ROLE_META.find((r) => r.value === selectedRole)?.descSw}
              </CardDescription>
            </CardHeader>
            <CardContent>
              <form onSubmit={handleSubmit} className="space-y-4">
                {mode === 'up' && (
                  <div className="space-y-1.5">
                    <Label htmlFor="name">{t('authName', lang)}</Label>
                    <Input id="name" value={name} onChange={(e) => setName(e.target.value)} required />
                  </div>
                )}
                <div className="space-y-1.5">
                  <Label htmlFor="email">{t('authEmail', lang)}</Label>
                  <Input id="email" type="email" value={email} onChange={(e) => setEmail(e.target.value)} required />
                </div>
                <div className="space-y-1.5">
                  <Label htmlFor="password">{t('authPassword', lang)}</Label>
                  <Input id="password" type="password" value={password} onChange={(e) => setPassword(e.target.value)} required minLength={6} />
                </div>
                <Button type="submit" disabled={loading} className="w-full">
                  {loading ? (
                    <Loader2 className="h-4 w-4 animate-spin" />
                  ) : (
                    <>{mode === 'in' ? t('authSignIn', lang) : t('authSignUp', lang)}</>
                  )}
                </Button>
              </form>

              <button
                onClick={switchMode}
                className="mt-4 w-full text-center text-sm text-muted-foreground hover:text-primary"
              >
                {mode === 'in' ? t('authToggleUp', lang) : t('authToggleIn', lang)}
              </button>
            </CardContent>
          </Card>
        )}

        {/* Demo access */}
        {/* <div className="mt-4 rounded-lg border border-accent/30 bg-accent/5 p-4">
          <div className="flex items-start gap-2.5">
            <ShieldCheck className="mt-0.5 h-4 w-4 shrink-0 text-accent" />
            <div>
              <p className="text-xs font-medium text-foreground">{t('authDemoNote', lang)}</p>
              <button
                onClick={() => navigate('/dashboard/mp')}
                className="mt-1.5 inline-flex items-center gap-1 text-sm font-semibold text-primary hover:underline"
              >
                <UserCircle2 className="h-4 w-4" />
                {lang === 'en' ? 'View dashboard as demo' : 'Ona dashibodi kama demo'}
              </button>
            </div>
          </div>
        </div> */}
      </div>
    </div>
  );
}
