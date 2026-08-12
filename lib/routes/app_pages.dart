import '../screens/laporan/laporan_page.dart';
import '../screens/survey/survey_page.dart';
import '../screens/auth/login_page.dart';
import '../screens/auth/register_page.dart';
import '../screens/dashboard/dashboard.dart';
import '../screens/profile/profile_page.dart';
import 'package:go_router/go_router.dart';
import '../screens/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) {
          final token = state.extra as String;

          return DashboardPage(token: token);
        },
      ),

      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) {
          final token = state.extra as String;

          return ProfilePage(token: token);
        },
      ),
      GoRoute(
        path: AppRoutes.survey,
        builder: (context, state) => const SurveyPage(),
      ),
      GoRoute(
        path: AppRoutes.laporan,
        builder: (context, state) => const LaporanPage(),
      ),
    ],
  );
}
