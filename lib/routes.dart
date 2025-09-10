import 'package:flutter/material.dart';
import 'presentation/mvvm/pages/login_page_mvvm.dart';
import 'presentation/bloc/pages/login_page_bloc.dart';
import 'presentation/dashboard_page.dart';
import 'presentation/splash_page.dart';
import 'presentation/onboarding_page.dart';

class Routes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String loginBloc = '/login_bloc';
  static const String loginMvvm = '/login_mvvm';
  static const String dashboard = '/dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case loginBloc:
        return MaterialPageRoute(builder: (_) => const LoginPageBloc());
      case loginMvvm:
        return MaterialPageRoute(builder: (_) => const LoginPageMVVM());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}