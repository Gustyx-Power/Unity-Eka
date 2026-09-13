import 'package:flutter/material.dart';
import 'unika_colors.dart';

class UnikaThemeData {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false, // Strict override for Solid Modern minimalist approach
      brightness: Brightness.dark,
      scaffoldBackgroundColor: UnikaColors.background,
      colorScheme: const ColorScheme.dark(
        primary: UnikaColors.primary,
        onPrimary: UnikaColors.onPrimary,
        surface: UnikaColors.surface,
        onSurface: UnikaColors.textPrimary,
        error: UnikaColors.error,
        background: UnikaColors.background,
        onBackground: UnikaColors.textPrimary,
      ),
      fontFamily: 'Inter', // Defaulting to a clean, sans-serif web font commonly used for this
      typography: Typography.material2021(colorScheme: const ColorScheme.dark()),
      
      // Override standard components to match the flat, sharp minimalist look
      appBarTheme: const AppBarTheme(
        backgroundColor: UnikaColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: UnikaColors.primary),
        titleTextStyle: TextStyle(
          color: UnikaColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: UnikaColors.primary,
          foregroundColor: UnikaColors.onPrimary,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)), // Slightly rounded corners
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: UnikaColors.textPrimary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
      ),
      
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: UnikaColors.surface,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: UnikaColors.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UnikaColors.border, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UnikaColors.primary, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: UnikaColors.error, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      
      dividerTheme: const DividerThemeData(
        color: UnikaColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }

  UnikaThemeData._();
}
