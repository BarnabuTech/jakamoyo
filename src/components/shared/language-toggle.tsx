import { Languages } from 'lucide-react';
import { useLang } from '@/lib/language-context';
import { cn } from '@/lib/utils';

export function LanguageToggle({ className }: { className?: string }) {
  const { lang, toggle } = useLang();
  return (
    <button
      onClick={toggle}
      className={cn(
        'inline-flex items-center gap-1.5 rounded-lg border border-border bg-background px-3 py-1.5 text-sm font-medium text-foreground transition-colors hover:bg-muted',
        className,
      )}
      aria-label="Toggle language"
    >
      <Languages className="h-4 w-4 text-primary" />
      <span className={cn(lang === 'en' && 'font-bold text-primary', lang === 'sw' && 'text-muted-foreground')}>EN</span>
      <span className="text-muted-foreground/40">|</span>
      <span className={cn(lang === 'sw' && 'font-bold text-primary', lang === 'en' && 'text-muted-foreground')}>SW</span>
    </button>
  );
}
