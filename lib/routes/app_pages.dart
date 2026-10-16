import 'package:field_survey_mobile_yayas/screens/survey/survey_page.dart';
import 'package:field_survey_mobile_yayas/screens/survey/survey_detail_page.dart';
import '../screens/survey/survey_form_page.dart';
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
        path: AppRoutes.splash,builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.register,builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,builder: (context, state) {
          return const DashboardPage();
        },
      ),
      GoRoute(
        path: '/profile',builder: (context, state) {
          return const ProfilePage();
        },
      ),
      GoRoute(
        path: AppRoutes.survey,builder: (context, state) => const SurveyPage(),
      ),
      GoRoute(
        path: AppRoutes.surveyDetail,builder: (context, state) {
          final id = state.extra as int;
          return SurveyDetailPage(surveyId: id);
        },
      ),
      GoRoute(
        path: AppRoutes.surveyForm,builder: (context, state) {
          final survey = state.extra as Map<String, dynamic>?;
          return SurveyFormPage(survey: survey);
        },
      ),
    ],
  );
}
