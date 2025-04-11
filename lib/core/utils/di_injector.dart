import 'package:ecommerce/config/theme/cubit/app_theme_cubit.dart';
import 'package:ecommerce/core/shared/blocs/auth/auth_bloc.dart';
import 'package:ecommerce/core/shared/blocs/products/products_bloc.dart';
import 'package:ecommerce/core/utils/app_bloc_observer.dart';
import 'package:ecommerce/data/repositories/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.I;

/// Top level initialization
/// Dependencies initialize here only when it need to access before routes, flutter or material app initialize
/// otherwise move the dependencies in initDependencies method for better UI/UX & Performance
Future<void> initializeDependenciesBeforeAppStart() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  // Blocs & Cubits
  getIt.registerSingleton(sharedPreferences);
  getIt.registerSingleton(AppThemeCubit.fromSharedPreference(getIt()));
  getIt.registerSingleton(await AuthBloc.init(getIt()));
}

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // Register services & repositories
  getIt.registerFactory(() => ProductRepository());

  // Blocs & Cubits
  getIt.registerSingleton(ProductsBloc(getIt()));
}
