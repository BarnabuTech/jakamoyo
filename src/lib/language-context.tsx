import { createContext, useContext, useEffect, useState, type ReactNode } from 'react';
import type { Language } from './types';

interface LangCtx {
  lang: Language;
  setLang: (l: Language) => void;
  toggle: () => void;
}

const LanguageContext = createContext<LangCtx | undefined>(undefined);

const STORAGE_KEY = 'wazi-lang';

export function LanguageProvider({ children }: { children: ReactNode }) {
  const [lang, setLangState] = useState<Language>(() => {
    if (typeof window === 'undefined') return 'en';
    return (localStorage.getItem(STORAGE_KEY) as Language) || 'en';
  });

  useEffect(() => {
    localStorage.setItem(STORAGE_KEY, lang);
    document.documentElement.lang = lang;
  }, [lang]);

  const setLang = (l: Language) => setLangState(l);
  const toggle = () => setLangState((p) => (p === 'en' ? 'sw' : 'en'));

  return (
    <LanguageContext.Provider value={{ lang, setLang, toggle }}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLang(): LangCtx {
  const ctx = useContext(LanguageContext);
  if (!ctx) throw new Error('useLang must be used within LanguageProvider');
  return ctx;
}
