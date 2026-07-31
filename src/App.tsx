import { lazy, Suspense } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { Toaster } from '@/components/ui/sonner';
import { LanguageProvider } from '@/lib/language-context';
import { AuthProvider, useAuth } from '@/lib/auth-context';
import { Header } from '@/components/shared/header';
import { CitizenPage } from '@/pages/citizen-page';
import { LandingPage } from '@/pages/landing-page';
import { roleRoute } from '@/lib/types';
import { Loader2 } from 'lucide-react';
import type { UserRole } from '@/lib/types';

const DashboardPage = lazy(() =>
  import('@/pages/dashboard-page').then((m) => ({ default: m.DashboardPage })),
);
const AuthPage = lazy(() =>
  import('@/pages/auth-page').then((m) => ({ default: m.AuthPage })),
);

function PageFallback() {
  return (
    <div className="flex min-h-[60vh] items-center justify-center">
      <Loader2 className="h-8 w-8 animate-spin text-primary" />
    </div>
  );
}

function RoleDashboard({ role }: { role: UserRole }) {
  return (
    <Suspense fallback={<PageFallback />}>
      <DashboardPage role={role} />
    </Suspense>
  );
}

function DashboardRedirect() {
  const { profile, loading } = useAuth();
  if (loading) return <PageFallback />;
  const role = profile?.role ?? 'MP';
  return <Navigate to={roleRoute(role)} replace />;
}

function AppRoutes() {
  return (
    <Routes>
      <Route path="/" element={<LandingPage />} />
      <Route path="/submit" element={<CitizenPage />} />
      <Route path="/auth" element={<Suspense fallback={<PageFallback />}><AuthPage /></Suspense>} />
      <Route path="/dashboard" element={<DashboardRedirect />} />
      <Route path="/dashboard/mp" element={<RoleDashboard role="MP" />} />
      <Route path="/dashboard/cdf" element={<RoleDashboard role="CDF_MANAGER" />} />
      <Route path="/dashboard/analyst" element={<RoleDashboard role="ANALYST" />} />
      <Route path="/dashboard/citizen" element={<RoleDashboard role="CITIZEN" />} />
    </Routes>
  );
}

export default function App() {
  return (
    <LanguageProvider>
      <AuthProvider>
        <BrowserRouter>
          <div className="min-h-screen bg-background">
            <Header />
            <main>
              <AppRoutes />
            </main>
          </div>
          <Toaster richColors position="top-center" />
        </BrowserRouter>
      </AuthProvider>
    </LanguageProvider>
  );
}
