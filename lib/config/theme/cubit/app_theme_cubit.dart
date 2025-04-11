import 'dart:async';

import 'package:ecommerce/core/constants/shared_preference_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeCubit extends Cubit<ThemeMode> {
  AppThemeCubit(super.initialState, this.sharedPreference);

  final SharedPreferences sharedPreference;

  factory AppThemeCubit.fromSharedPreference(
    SharedPreferences sharedPreference,
  ) {
    final themeIndex =
        sharedPreference.getInt(SharedPreferenceKeys.themeIndex) ?? 0;

    final themeMode = ThemeMode.values[themeIndex];
    return AppThemeCubit(themeMode, sharedPreference);
  }

  void changeTheme(ThemeMode themeMode) {
    if (state == themeMode) return;
    unawaited(
      sharedPreference.setInt(SharedPreferenceKeys.themeIndex, themeMode.index),
    );
    emit(themeMode);
  }
}
