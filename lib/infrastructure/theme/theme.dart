// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/constant.dart';
import 'typografi.dart';

class MahasTheme {
  static final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    primaryColor: MahasColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: MahasColors.primaryColor,
      primaryContainer: MahasColors.primaryLightColor,
      secondary: MahasColors.lightSecondaryColor,
      secondaryContainer: MahasColors.lightSecondaryLightColor,
      surface: MahasColors.lightSurfaceColor,
      background: MahasColors.lightBackgroundColor,
      error: MahasColors.errorColor,
      onPrimary: Colors.white,
      onSecondary: MahasColors.lightTextPrimaryColor,
      onSurface: MahasColors.lightTextPrimaryColor,
      onBackground: MahasColors.lightTextPrimaryColor,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: MahasColors.lightBackgroundColor,
    cardColor: MahasColors.lightCardColor,
    appBarTheme: AppBarTheme(
      backgroundColor: MahasColors.primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: MahasTypography.headline6
          .copyWith(color: MahasColors.lightTextSecondaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MahasColors.lightCardColor,
      selectedItemColor: MahasColors.primaryColor,
      unselectedItemColor: MahasColors.lightTextSecondaryColor,
    ),
    textTheme: TextTheme(
      displayLarge: MahasTypography.headline1
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      displayMedium: MahasTypography.headline2
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      displaySmall: MahasTypography.headline3
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      headlineMedium: MahasTypography.headline4
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      headlineSmall: MahasTypography.headline5
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      titleLarge: MahasTypography.headline6
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      titleMedium: MahasTypography.subtitle1
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      titleSmall: MahasTypography.subtitle2
          .copyWith(color: MahasColors.lightTextSecondaryColor),
      bodyLarge: MahasTypography.bodyText1
          .copyWith(color: MahasColors.lightTextPrimaryColor),
      bodyMedium: MahasTypography.bodyText2
          .copyWith(color: MahasColors.lightTextSecondaryColor),
      labelLarge: MahasTypography.button.copyWith(color: Colors.white),
      bodySmall: MahasTypography.caption
          .copyWith(color: MahasColors.lightTextSecondaryColor),
      labelSmall: MahasTypography.overline
          .copyWith(color: MahasColors.lightTextSecondaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: MahasColors.primaryColor,
        textStyle: MahasTypography.button,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MahasColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MahasColors.primaryLightColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MahasColors.errorColor),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    primaryColor: MahasColors.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: MahasColors.primaryColor,
      primaryContainer: MahasColors.primaryLightColor,
      secondary: MahasColors.darkSecondaryColor,
      secondaryContainer: MahasColors.darkSecondaryLightColor,
      surface: MahasColors.darkSurfaceColor,
      background: MahasColors.darkBackgroundColor,
      error: MahasColors.errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: MahasColors.darkBackgroundColor,
    cardColor: MahasColors.darkCardColor,
    appBarTheme: AppBarTheme(
      backgroundColor: MahasColors.primaryColor,
      foregroundColor: Colors.white,
      titleTextStyle: MahasTypography.headline6
          .copyWith(color: MahasColors.darkTextSecondaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: MahasColors.darkCardColor,
      selectedItemColor: MahasColors.primaryLightColor,
      unselectedItemColor: Colors.white70,
    ),
    textTheme: TextTheme(
      displayLarge: MahasTypography.headline1
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      displayMedium: MahasTypography.headline2
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      displaySmall: MahasTypography.headline3
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      headlineMedium: MahasTypography.headline4
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      headlineSmall: MahasTypography.headline5
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      titleLarge: MahasTypography.headline6
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      titleMedium: MahasTypography.subtitle1
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      titleSmall: MahasTypography.subtitle2
          .copyWith(color: MahasColors.darkTextSecondaryColor),
      bodyLarge: MahasTypography.bodyText1
          .copyWith(color: MahasColors.darkTextPrimaryColor),
      bodyMedium: MahasTypography.bodyText2
          .copyWith(color: MahasColors.darkTextSecondaryColor),
      labelLarge: MahasTypography.button.copyWith(color: Colors.black),
      bodySmall: MahasTypography.caption
          .copyWith(color: MahasColors.darkTextSecondaryColor),
      labelSmall: MahasTypography.overline
          .copyWith(color: MahasColors.darkTextSecondaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: MahasColors.primaryColor,
        textStyle: MahasTypography.button,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: MahasColors.darkSurfaceColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MahasColors.primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MahasColors.primaryLightColor),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MahasColors.errorColor),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
