import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:ecommerce_app/screens/cart/cart_screen.dart';
import 'package:ecommerce_app/screens/forget_password/forget_password_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:ecommerce_app/screens/order/order_screen.dart';
import 'package:ecommerce_app/screens/product_details/product_details_screen.dart';
import 'package:ecommerce_app/screens/profile/profile_screen.dart';
import 'package:ecommerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce_app/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce_app/screens/walk_through/walk_through_screen.dart';
import 'package:ecommerce_app/screens/wishlist/wishlist_screen.dart';
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
        path: AppRoutes.forgetPasswordScreen.path,
        name: AppRoutes.forgetPasswordScreen.name,
        pageBuilder: (context, state) {
          return _buildFadeTransition(
            context: context,
            child: ForgetPasswordScreen(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.homeScreen.path,
        name: AppRoutes.homeScreen.name,
        pageBuilder: (context, state) {
          return _buildFadeTransition(context: context, child: HomeScreen());
        },

        routes: [
          GoRoute(
            path: AppRoutes.wishlistScreen.path,
            name: AppRoutes.wishlistScreen.name,
            pageBuilder: (context, state) {
              return _buildFadeTransition(
                context: context,
                child: WishlistScreen(),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.cartScreen.path,
            name: AppRoutes.cartScreen.name,
            pageBuilder: (context, state) {
              return _buildFadeTransition(
                context: context,
                child: CartScreen(),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.orderHistoryScreen.path,
            name: AppRoutes.orderHistoryScreen.name,
            pageBuilder: (context, state) {
              return _buildFadeTransition(
                context: context,
                child: OrderScreen(),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.productDetailsScreen.path,
            name: AppRoutes.productDetailsScreen.name,
            pageBuilder: (context, state) {
              return _buildFadeTransition(
                context: context,
                child: ProductDetailsScreen(product: state.extra as Product),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.profileScreen.path,
            name: AppRoutes.profileScreen.name,
            pageBuilder: (context, state) {
              return _buildFadeTransition(
                context: context,
                child: ProfileScreen(),
              );
            },
          ),
        ],
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
