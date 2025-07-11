

import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/util/theme/material3_theme.dart';
// import 'package:roqsal_quizapp_2026/util/themeRoq/color_schemes.dart';



class AppTheme {
  static ThemeData lightTheme() {
    return MaterialTheme(TextTheme()).light();
  }
  static ThemeData darkTheme() {
    return MaterialTheme(TextTheme()).dark();
  }

  static ThemeData lightHighContrast() {
    return MaterialTheme(TextTheme()).lightHighContrast();
  }

  static ThemeData lightMediumContrast() {
    return MaterialTheme(TextTheme()).lightMediumContrast();
  }

  static ThemeData darkHighContrast() {
    return MaterialTheme(TextTheme()).darkHighContrast();
  }

  static ThemeData darkMediumContrast() {
    return MaterialTheme(TextTheme()).darkMediumContrast();
  }


  // static ThemeData darkTheme_New() {
  //   return ThemeData(
  //     useMaterial3: true,
  //     colorScheme: AppColorSchemes.darkScheme,
  //     textTheme: AppTextThemes.textTheme.apply(
  //       bodyColor: AppColorSchemes.darkScheme.onSurface,
  //       displayColor: AppColorSchemes.darkScheme.onSurface,
  //     ),
  //     appBarTheme: AppBarTheme(
  //       backgroundColor: AppColorSchemes.darkScheme.primaryContainer,
  //       foregroundColor: AppColorSchemes.darkScheme.onPrimaryContainer,
  //       elevation: 2,
  //     ),
  //     elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: AppColorSchemes.darkScheme.primary,
  //         foregroundColor: AppColorSchemes.darkScheme.onPrimary,
  //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //       ),
  //     ),
  //     cardTheme: CardTheme(
  //       color: AppColorSchemes.darkScheme.surface,
  //       elevation: 4,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //     ),
  //     extensions: const [
  //       AppCustomColors.dark,
  //     ],
  //   );
  // }
}