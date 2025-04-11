import 'package:flutter/widgets.dart';

enum SupportedLocales {
  en(title: 'English', locale: Locale('en')),
  hi(title: 'हिंदी', locale: Locale('hi'));

  final String title;
  final Locale locale;

  const SupportedLocales({required this.title, required this.locale});

  factory SupportedLocales.fromLocale(Locale locale) {
    return values.firstWhere((element) => element.locale == locale);
  }
}
