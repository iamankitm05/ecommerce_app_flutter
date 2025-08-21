import 'package:ecommerce_app/routes/app_router.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

abstract final class DiInjector {
  static Future<void> initGlobalDependency() async {
    getIt.registerSingleton(AppRouter());
  }
}
