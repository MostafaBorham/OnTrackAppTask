import 'package:flutter/material.dart';

abstract class LocalizationConstants {
  static const String arabicLangCode = 'ar';
  static const String englishLangCode = 'en';
  static const String arabicCountryCode = 'EG';
  static const String englishCountryCode = 'US';
  static const String translationsPath = 'assets/translations';
  static const Locale arabicLocale = Locale(arabicLangCode, arabicCountryCode);
  static const Locale englishLocale = Locale(englishLangCode, englishCountryCode);
  static const List<Locale> supportedLocales = [arabicLocale, englishLocale];
}
