import 'dart:async';

import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/config/routes/not_found_screen.dart';
import 'package:ecommerce/core/shared/blocs/auth/auth_bloc.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:ecommerce/data/models/product/product.dart';
import 'package:ecommerce/presentation/forget_password/forget_password_screen.dart';
import 'package:ecommerce/presentation/home/home_screen.dart';
import 'package:ecommerce/presentation/login/login_screen.dart';
import 'package:ecommerce/presentation/product_details/product_details_screen.dart';
import 'package:ecommerce/presentation/profile/profile_screen.dart';
import 'package:ecommerce/presentation/sign_up/sign_up_screen.dart';
import 'package:ecommerce/presentation/splash/splash_screen.dart';
import 'package:ecommerce/presentation/walk_through/walk_through_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  late final GoRouter _router;
  GoRouter get router => _router;

  static final instance = AppRouter._();

  AppRouter._() {
    _router = GoRouter(
      routes: _routes,
      initialLocation: AppRoutes.splashScreen.path,
    );
  }

  List<RouteBase> get _routes {
    return [
      GoRoute(
        name: AppRoutes.splashScreen.name,
        path: AppRoutes.splashScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(context: context, child: SplashScreen());
        },
      ),
      GoRoute(
        name: AppRoutes.walkthroughScreen.name,
        path: AppRoutes.walkthroughScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(
            context: context,
            child: WalkThroughScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.loginScreen.name,
        path: AppRoutes.loginScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(context: context, child: LoginScreen());
        },
        redirect: _redirectIfAuthenticated,
      ),
      GoRoute(
        name: AppRoutes.signUpScreen.name,
        path: AppRoutes.signUpScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(context: context, child: SignUpScreen());
        },
        redirect: _redirectIfAuthenticated,
      ),
      GoRoute(
        name: AppRoutes.forgetPasswordScreen.name,
        path: AppRoutes.forgetPasswordScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(
            context: context,
            child: ForgetPasswordScreen(),
          );
        },
        redirect: _redirectIfAuthenticated,
      ),
      GoRoute(
        name: AppRoutes.homeScreen.name,
        path: AppRoutes.homeScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(context: context, child: HomeScreen());
        },
      ),
      GoRoute(
        name: AppRoutes.productScreen.name,
        path: AppRoutes.productScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(
            context: context,
            child:
                state.extra is Product
                    ? ProductDetailsScreen(state.extra as Product)
                    : NotFoundScreen(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.profileScreen.name,
        path: AppRoutes.profileScreen.path,
        pageBuilder: (context, state) {
          return _fadeTransitionPage(context: context, child: ProfileScreen());
        },
        redirect: _redirectIfUnauthenticated,
      ),
    ];
  }

  Page<void> _fadeTransitionPage({
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

  FutureOr<String?> _redirectIfAuthenticated(
    BuildContext context,
    GoRouterState state,
  ) {
    final authState = getIt<AuthBloc>().state;
    if (authState is AuthAuthenticated) {
      return AppRoutes.homeScreen.path;
    }
    return null;
  }

  FutureOr<String?> _redirectIfUnauthenticated(
    BuildContext context,
    GoRouterState state,
  ) {
    final authState = getIt<AuthBloc>().state;
    if (authState is AuthUnauthenticated) {
      return AppRoutes.loginScreen.path;
    }
    return null;
  }
}
