import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

abstract class AppThemes {
  static ThemeData getLightModeTheme() => ThemeData(
        fontFamily: AppFonts.raleway,
        scaffoldBackgroundColor: AppColors.grey_b6b6c9,
        colorScheme: ColorScheme.light(
          primaryFixed: AppColors.grey_b6b6c9,
          onPrimaryFixed: AppColors.black,
          primaryContainer: AppColors.black_opc8,
          surface: AppColors.blue_214f69,
          onSurface: AppColors.black_opc20,
          primary: AppColors.white_b2c2c2,
          outline: AppColors.black_opc40,
          onPrimary: AppColors.grey_9b9bbb,
          error: AppColors.red,
          onError: AppColors.brown_55523b,
          tertiary: AppColors.yellow_cdcc12,
          onSecondary: AppColors.black_opc10,
          shadow: AppColors.black_opc32,
          onSecondaryFixed: AppColors.grey_616161,
          onPrimaryContainer: AppColors.grey_b6b6c9,
        ),
      );
  //////////////////////////////////////////////////////////////////////////////
  static ThemeData getDarkModeTheme() => ThemeData(
        scaffoldBackgroundColor: AppColors.grey_343541,
        fontFamily: AppFonts.raleway,
        colorScheme: ColorScheme.dark(
          primaryFixed: AppColors.grey_343541,
          onPrimaryFixed: AppColors.white,
          primaryContainer: AppColors.white_opc8,
          surface: AppColors.blue_2c6881,
          onSurface: AppColors.white_opc20,
          primary: AppColors.black_202123,
          outline: AppColors.white_opc40,
          onPrimary: AppColors.grey_343541,
          error: AppColors.red_ED8C8C,
          onError: AppColors.yellow_FBF3AD,
          tertiary: AppColors.yellow_887B06,
          onSecondary: AppColors.white_opc10,
          shadow: AppColors.white_opc32,
          onSecondaryFixed: AppColors.grey_b1b1b1,
          onPrimaryContainer: AppColors.grey_343541,
        ),
      );
}
