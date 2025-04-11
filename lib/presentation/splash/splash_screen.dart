import 'dart:async';

import 'package:ecommerce/config/routes/app_routes.dart';
import 'package:ecommerce/core/constants/shared_preference_keys.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Splash')));
  }

  @override
  void initState() {
    super.initState();
    [
      //...
      initializeDependencies(),
      Future.delayed(Duration(seconds: 1)),
    ].wait.then((value) {
      if (mounted) {
        final userOnboarded =
            // getIt<SharedPreferences>().getBool(
            //   SharedPreferenceKeys.userOnboarded,
            // ) ??
            false;
        if (userOnboarded) {
          context.goNamed(AppRoutes.loginScreen.name);
        } else {
          unawaited(
            getIt<SharedPreferences>().setBool(
              SharedPreferenceKeys.userOnboarded,
              true,
            ),
          );
          context.goNamed(AppRoutes.walkthroughScreen.name);
        }
      }
    });
  }
}
