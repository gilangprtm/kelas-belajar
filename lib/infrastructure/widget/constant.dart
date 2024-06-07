// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class MahasColors {
  // Shared Colors
  static const Color primaryColor = Color(0xFF1DA1F2); // Twitter Blue
  static const Color primaryLightColor =
      Color(0xFF71C9F8); // Light Twitter Blue
  static const Color primaryDarkColor = Color(0xFF1A91DA); // Dark Twitter Blue

  static const Color errorColor = Color(0xFFE0245E); // Red
  static const Color successColor = Color(0xFF17BF63); // Green
  static const Color transparent = Colors.transparent;

  // Light Mode Colors
  static const Color lightSecondaryColor = Color(0xFFF5F8FA); // Light Gray
  static const Color lightSecondaryLightColor = Color(0xFFFFFFFF); // White
  static const Color lightSecondaryDarkColor = Color(0xFFE1E8ED); // Gray

  static const Color lightBackgroundColor = Color(0xFFFFFFFF); // White
  static const Color lightSurfaceColor =
      Color(0xFFF5F8FA); // Light Gray Surface
  static const Color lightCardColor = Color(0xFFFFFFFF); // White

  static const Color lightTextPrimaryColor = Color(0xFF14171A); // Dark Gray
  static const Color lightTextSecondaryColor = Color(0xFF657786); // Gray

  // Dark Mode Colors
  static const Color darkSecondaryColor = Color(0xFF1B2836); // Dark Gray
  static const Color darkSecondaryLightColor = Color(0xFF22303C); // Darker Gray
  static const Color darkSecondaryDarkColor =
      Color(0xFF15202B); // Very Dark Gray

  static const Color darkBackgroundColor = Color(0xFF121212); // Very Dark Gray
  static const Color darkSurfaceColor = Color(0xFF192734); // Dark Surface
  static const Color darkCardColor = Color(0xFF22303C); // Darker Gray

  static const Color darkTextPrimaryColor = Color(0xFFFFFFFF); // White
  static const Color darkTextSecondaryColor = Color(0xFF8899A6); // Light Gray
}

class AppImages {
  static const String placeholder = 'assets/placeholder.png';
  static const String sampleSvg = 'assets/sample.svg';
}

enum MenuType {
  normal,
  underlined,
  pill,
  iconOnly,
}

enum ButtonType {
  primary,
  secondary,
  outline,
  text,
  icon,
}

enum AlertType {
  info,
  confirmation,
  error,
  succes,
}

enum BadgePosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  center,
}

enum MahasAvatarType {
  image,
  icon,
  outline,
}

enum MahasAvatarSize {
  small,
  medium,
  large,
}

enum MahasToastPosition {
  top,
  bottom,
}

class MahasBorderRadius {
  static const BorderRadius none = BorderRadius.zero;
  static const BorderRadius small = BorderRadius.all(Radius.circular(4.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(8.0));
  static const BorderRadius large = BorderRadius.all(Radius.circular(16.0));
  static const BorderRadius extraLarge =
      BorderRadius.all(Radius.circular(32.0));
  static const BorderRadius circle = BorderRadius.all(Radius.circular(50.0));
  static const BorderRadius ellipse = BorderRadius.all(Radius.circular(100.0));
}

enum MahasTypographyType {
  title,
  subtitle,
  s,
  m,
  l,
  xl,
}
