import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/screens/walk_through/walk_through_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter() {
    _router = GoRouter(
      routes: _routes,
      initialLocation: AppRoutes.onboardingScreen.path,
    );
  }

  late final GoRouter _router;
  GoRouter get router => _router;

  List<RouteBase> get _routes {
    return [
      GoRoute(
        path: AppRoutes.onboardingScreen.path,
        name: AppRoutes.onboardingScreen.name,
        pageBuilder: (context, state) {
          return _buildFadeTransition(
            context: context,
            child: WalkThroughScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signInScreen.path,
        name: AppRoutes.signInScreen.name,
        pageBuilder: (context, state) {
          return _buildFadeTransition(context: context, child: SignInScreen());
        },
      ),
      GoRoute(
        path: AppRoutes.signUpScreen.path,
        name: AppRoutes.signUpScreen.name,
        pageBuilder: (context, state) {
          return _buildFadeTransition(context: context, child: SignUpScreen());
        },
      ),
      GoRoute(
        path: AppRoutes.homeScreen.path,
        name: AppRoutes.homeScreen.name,
        pageBuilder: (context, state) {
          return _buildFadeTransition(context: context, child: HomeScreen());
        },
      ),
    ];
  }

  Page<void> _buildFadeTransition({
    required BuildContext context,
    required Widget child,
  }) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
