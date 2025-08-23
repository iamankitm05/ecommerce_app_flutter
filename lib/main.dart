import 'package:ecommerce_app/routes/app_router.dart';
import 'package:ecommerce_app/utils/app_theme_provider.dart';
import 'package:ecommerce_app/utils/di_injector.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DiInjector.initGlobalDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: getIt<AppRouter>().router,
        debugShowCheckedModeBanner: false,
        theme: AppThemeProvider.getTheme(Brightness.light),
        darkTheme: AppThemeProvider.getTheme(Brightness.dark),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
