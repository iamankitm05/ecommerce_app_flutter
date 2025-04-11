import 'package:ecommerce/config/theme/app_theme.dart';
import 'package:ecommerce/config/theme/cubit/app_theme_cubit.dart';
import 'package:ecommerce/core/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'config/routes/app_router.dart';

void main() async {
  await initializeDependenciesBeforeAppStart();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, ThemeMode>(
      bloc: getIt(),
      builder: (context, state) {
        return ToastificationWrapper(
          child: MaterialApp.router(
            title: 'E-Commerce App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state,
            routerConfig: AppRouter.instance.router,
          ),
        );
      },
    );
  }
}
