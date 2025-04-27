import 'package:apple/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  fontFamily: GoogleFonts.inter().fontFamily,
  scaffoldBackgroundColor: AppColors.surface,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surface,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.black),
  ),
  colorScheme: const ColorScheme.light(
    surfaceContainer: AppColors.white,
    primary: AppColors.primary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.subText,
    surface: AppColors.surface,
    onSurface: AppColors.black,
    surfaceTint: AppColors.fadedText,
    surfaceContainerHighest: Colors.transparent,
  ),
  textTheme: TextTheme(

    displayLarge: GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.fadedText,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.subText,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: AppColors.white,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.focusedBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.lightGray),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    hintStyle: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.hint,
    ),
    errorStyle: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.error,
    ),
    labelStyle: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.subText,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.bottomNavUnselected,
    selectedLabelStyle: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelStyle: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5.sp,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    dividerColor: Colors.transparent,
  ),
);

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  fontFamily: GoogleFonts.inter().fontFamily,
  scaffoldBackgroundColor: AppColors.darkScaffold,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkInputFill,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: AppColors.white),
  ),
  colorScheme: const ColorScheme.dark(
    surfaceContainer: AppColors.darkInputFill,
    primary: AppColors.primary,
    secondary: AppColors.fadedText,
    onSecondary: AppColors.darkUnselectedText,
    surface: AppColors.darkSurface,
    onSurface: AppColors.white,
    surfaceTint: AppColors.fadedText,
    surfaceContainerHighest: Colors.transparent,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.fadedText,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.darkUnselectedText,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: AppColors.darkInputFill,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.focusedBorder),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.darkBorder),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0.r),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    hintStyle: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.hint,
    ),
    errorStyle: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.error,
    ),
    labelStyle: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.darkUnselectedText,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkInputFill,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.darkUnselectedText,
    selectedLabelStyle: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    ),
    selectedIconTheme: const IconThemeData(
      color: AppColors.primary,
    ),
    unselectedLabelStyle: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5.sp,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    dividerColor: Colors.transparent,
  ),
);
