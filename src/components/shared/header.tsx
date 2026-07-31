import { Link, useNavigate } from 'react-router-dom';
import { LogOut } from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { useAuth } from '@/lib/auth-context';
import { t } from '@/lib/i18n';
import { LanguageToggle } from './language-toggle';
import { Button } from '@/components/ui/button';

export function Header() {
  const { lang } = useLang();
  const { session, profile, signOut } = useAuth();
  const navigate = useNavigate();

  return (
    <header className="sticky top-0 z-40 w-full border-b border-border/80 bg-background/85 backdrop-blur-md">
      <div className="mx-auto flex h-16 max-w-7xl items-center justify-between px-4 sm:px-6 lg:px-8">
        <Link to="/" className="flex items-center gap-2.5 transition-opacity hover:opacity-90">
          <div className="flex h-9 w-9 items-center justify-center overflow-hidden rounded-xl shadow-sm">
            <img src="/images/icon.jpg" alt="Jakamoyo logo" className="h-full w-full object-cover" />
          </div>
          <div className="hidden sm:block">
            <div className="text-sm font-bold leading-tight text-foreground">Jakamoyo</div>
            <div className="text-[11px] leading-tight text-muted-foreground">AI for Kenyan CDF</div>
          </div>
        </Link>

        <div className="flex items-center gap-1.5 sm:gap-2">
          <LanguageToggle />

          {session ? (
            <div className="flex items-center gap-2">
              {profile && (
                <span className="hidden text-xs font-medium text-muted-foreground md:inline">
                  {profile.full_name} · {profile.role}
                </span>
              )}
              <Button
                variant="ghost"
                size="sm"
                onClick={() => { signOut(); navigate('/'); }}
                className="text-muted-foreground hover:text-destructive"
              >
                <LogOut className="h-4 w-4" />
                <span className="hidden sm:inline">{t('navSignOut', lang)}</span>
              </Button>
            </div>
          ) : (
            <div className="flex items-center gap-1.5 sm:gap-2">
              <Button asChild variant="ghost" size="sm">
                <Link to="/auth">{t('navSignIn', lang)}</Link>
              </Button>
              <Button asChild size="sm">
                <Link to="/auth">{t('navSignUp', lang)}</Link>
              </Button>
            </div>
          )}
        </div>
      </div>
    </header>
  );
}
