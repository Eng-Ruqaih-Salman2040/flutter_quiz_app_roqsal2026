

import 'package:flutter/material.dart';
import 'package:roqsal_quizapp_2026/util/theme/extendedColor.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00437a),
      surfaceTint: Color(0xff0f60a7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005ba2),
      onPrimaryContainer: Color(0xffb5d3ff),
      secondary: Color(0xff4b607d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc6dbfe),
      onSecondaryContainer: Color(0xff4b607e),
      tertiary: Color(0xff602977),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a4291),
      onTertiaryContainer: Color(0xfff0c0ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff414751),
      outline: Color(0xff727782),
      outlineVariant: Color(0xffc1c7d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffa3c9ff),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001c38),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff004882),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff031c36),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff334864),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff320047),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff652e7c),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffecedf4),
      surfaceContainerHigh: Color(0xffe7e8ee),
      surfaceContainerHighest: Color(0xffe1e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003766),
      surfaceTint: Color(0xff0f60a7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005ba2),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff223752),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff596e8c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff531c6a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff7a4291),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff0e1116),
      onSurfaceVariant: Color(0xff313640),
      outline: Color(0xff4d535d),
      outlineVariant: Color(0xff686d78),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffa3c9ff),
      primaryFixed: Color(0xff296fb7),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00569a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff596e8c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff415673),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8f56a6),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff753d8c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc5c6cd),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffe7e8ee),
      surfaceContainerHigh: Color(0xffdbdce3),
      surfaceContainerHighest: Color(0xffd0d1d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002d55),
      surfaceTint: Color(0xff0f60a7),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004a86),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff172d48),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff354a66),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff480e5f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff68317f),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272c35),
      outlineVariant: Color(0xff444953),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3036),
      inversePrimary: Color(0xffa3c9ff),
      primaryFixed: Color(0xff004a86),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff003460),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff354a66),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff1e344f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff68317f),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4f1766),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb7b8bf),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff0f7),
      surfaceContainer: Color(0xffe1e2e9),
      surfaceContainerHigh: Color(0xffd3d4db),
      surfaceContainerHighest: Color(0xffc5c6cd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa3c9ff),
      surfaceTint: Color(0xffa3c9ff),
      onPrimary: Color(0xff00315c),
      primaryContainer: Color(0xff005ba2),
      onPrimaryContainer: Color(0xffb5d3ff),
      secondary: Color(0xffb2c8ea),
      onSecondary: Color(0xff1c314c),
      secondaryContainer: Color(0xff334864),
      onSecondaryContainer: Color(0xffa1b7d8),
      tertiary: Color(0xffebb2ff),
      onTertiary: Color(0xff4c1464),
      tertiaryContainer: Color(0xff7a4291),
      onTertiaryContainer: Color(0xfff0c0ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff111418),
      onSurface: Color(0xffe1e2e9),
      onSurfaceVariant: Color(0xffc1c7d2),
      outline: Color(0xff8b919c),
      outlineVariant: Color(0xff414751),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff0f60a7),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001c38),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff004882),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff031c36),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff334864),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff320047),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff652e7c),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff37393e),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc9deff),
      surfaceTint: Color(0xffa3c9ff),
      onPrimary: Color(0xff00264a),
      primaryContainer: Color(0xff5593de),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc9deff),
      onSecondary: Color(0xff0f2641),
      secondaryContainer: Color(0xff7d92b2),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff5d0ff),
      onTertiary: Color(0xff400458),
      tertiaryContainer: Color(0xffb679cd),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff111418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd7dce8),
      outline: Color(0xffadb2be),
      outlineVariant: Color(0xff8b909c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff004984),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff001227),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff003766),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff001227),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff223752),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff220031),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff531c6a),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff42444a),
      surfaceContainerLowest: Color(0xff05070c),
      surfaceContainerLow: Color(0xff1b1e22),
      surfaceContainer: Color(0xff25282d),
      surfaceContainerHigh: Color(0xff303338),
      surfaceContainerHighest: Color(0xff3b3e43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe9f0ff),
      surfaceTint: Color(0xffa3c9ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff9cc5ff),
      onPrimaryContainer: Color(0xff000c1d),
      secondary: Color(0xffe9f0ff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffaec4e6),
      onSecondaryContainer: Color(0xff000c1d),
      tertiary: Color(0xfffeeaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffeaacff),
      onTertiaryContainer: Color(0xff190025),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff111418),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffebf0fc),
      outlineVariant: Color(0xffbdc3ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e2e9),
      inversePrimary: Color(0xff004984),
      primaryFixed: Color(0xffd3e3ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffa3c9ff),
      onPrimaryFixedVariant: Color(0xff001227),
      secondaryFixed: Color(0xffd3e3ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb2c8ea),
      onSecondaryFixedVariant: Color(0xff001227),
      tertiaryFixed: Color(0xfff8d8ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffebb2ff),
      onTertiaryFixedVariant: Color(0xff220031),
      surfaceDim: Color(0xff111418),
      surfaceBright: Color(0xff4e5056),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1d2024),
      surfaceContainer: Color(0xff2e3036),
      surfaceContainerHigh: Color(0xff393b41),
      surfaceContainerHighest: Color(0xff44474c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}