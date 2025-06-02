import 'package:ed_tech/config/app_colors.dart';
import 'package:ed_tech/config/app_typography.dart';
import 'package:flutter/material.dart';


class AppTheme {
  /// Light theme
  static ThemeData getLightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: AppTypography.anekLatin,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTypography.getTheme(context),

      /// AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: AppTypography.h1(context).copyWith(color: Colors.black),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      /// Input Fields
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTypography.inputPlaceholder(context),
        labelStyle: AppTypography.inputText(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),

      /// Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppTypography.inputText(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          backgroundColor: AppColors.buttonColor,
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
      ),

      /// Card Theme
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      /// Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.white),
        fillColor: WidgetStateProperty.all(AppColors.primary),
      ),

      /// Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(AppColors.primary),
        trackColor: WidgetStateProperty.all(AppColors.textSecondary),
      ),

      /// Draer theme
      drawerTheme:
          const DrawerThemeData(backgroundColor: AppColors.white),
    );
  }

  /// Dark theme
  static ThemeData getDarkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTypography.anekLatin,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: AppTypography.getTheme(context),

      /// AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
        titleTextStyle:
            AppTypography.h1(context).copyWith(color: AppColors.textPrimary),
        iconTheme: const IconThemeData(color: AppColors.textSecondary),
      ),

      /// Input Fields
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTypography.inputPlaceholder(context),
        labelStyle: AppTypography.inputText(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.textSecondary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),

      /// Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: AppTypography.inputText(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          backgroundColor: AppColors.primary,
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textTertiary,
      ),

      /// Card Theme
      cardTheme: CardTheme(
        color: Colors.grey.shade900,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      /// Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(Colors.black),
        fillColor: WidgetStateProperty.all(AppColors.primary),
      ),

      /// Switch Theme
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(AppColors.primary),
        trackColor: WidgetStateProperty.all(AppColors.textTertiary),
      ),

      /// Draer theme
      drawerTheme:
          const DrawerThemeData(backgroundColor: AppColors.textPrimary),
    );
  }
}
