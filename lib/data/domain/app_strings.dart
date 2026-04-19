import 'package:flutter/material.dart';

class AppColors {
  // Background gradient colors
  static const Color backgroundStart = Color(0xFF0F2027); // dark teal-black
  static const Color backgroundEnd = Color(0xFF000000);   // pure black

  // Primary button (Login)
  static const Color primaryButton = Color(0xFF3A7CA5); // soft blue
  static const Color primaryButtonText = Colors.white;

  // Input field border
  static const Color inputBorder = Color(0xFF2C5364);

  // Divider / subtle lines
  static const Color divider = Color(0xFF3A3A3A);

  // Text colors
  static const Color primaryText = Colors.white;
  static const Color secondaryText = Color(0xFFB0B0B0);

  // Social buttons
  static const Color googleButtonBorder = Color(0xFF444444);
  static const Color appleButtonBorder = Color(0xFF444444);

  // Checkbox
  static const Color checkbox = Color(0xFF3A7CA5);
}

class AppGradients {
  static const LinearGradient mainBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.backgroundStart,
      AppColors.backgroundEnd,
    ],
  );
}