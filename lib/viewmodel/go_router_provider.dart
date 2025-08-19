import 'package:ecommerce_app/utils/app_routes.dart';
import 'package:ecommerce_app/view/home_screen.dart';
import 'package:ecommerce_app/view/sign_in_screen.dart';
import 'package:ecommerce_app/view/sign_up_screen.dart';
import 'package:ecommerce_app/view/walk_through_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  return GoRouter(
    routes: [
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
    ],
  );
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
