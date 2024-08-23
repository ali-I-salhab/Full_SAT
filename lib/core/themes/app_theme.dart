
import 'package:flutter/material.dart';
import 'package:osta/core/constants/app_colors.dart';

enum AppTheme{
  lightTheme,
  darkTheme;
  const AppTheme();
}

final appThemeData = {
  AppTheme.lightTheme : ThemeData(
    // useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'SpaceGrotesk',
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor:Colors.transparent,
      // AppColors.lightBackgroundColor,
      elevation: 0,
        // titleTextStyle: AppTextStyles.labelTextStyle,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.secondaryColor ,
opacity: 1,
        ),
      ),
    iconTheme: IconThemeData(
      color: AppColors.iconColor,
      size: 20,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
    ),
    dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      backgroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor:AppColors.primaryColor,
          foregroundColor: Colors.white,
          // textStyle:AppTextStyles.buttonTextStyle
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            foregroundColor: MaterialStateProperty.all(AppColors.primaryColor ),
          // textStyle:MaterialStateProperty.all( AppTextStyles.buttonTextStyle)
        )),
    textTheme: TextTheme(
      // labelMedium: AppTextStyles.labelTextStyle,
      // labelSmall: AppTextStyles.labelSmallTextStyle,
      // bodyMedium: AppTextStyles.bodyMediumTextStyle,
      // titleMedium:
    ),
    cardColor: Colors.white,
    backgroundColor: AppColors.lightBackgroundColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      
    )
  ),
  AppTheme.darkTheme : ThemeData(

      useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: 'SpaceGrotesk',
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // titleTextStyle: AppTextStyles.labelTextStyle,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.lightBackgroundColor ),
      ),
      backgroundColor: AppColors.darkBackgroundColor,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryColor,
      )
      // colorScheme: ColorScheme(
      //
      //   primary: AppColors.primaryColor, brightness: Brightness.dark,background:Colors.transparent, onPrimary: AppColors.primaryColor, secondary: AppColors.secondaryColor,onSecondary: AppColors.secondaryColor, error: Colors.orange,onError: Colors.orange, surface: AppColors.grey,onSurface: AppColors.grey,onBackground: AppColors.darkBackgroundColor )
      // backgroundColor: Colors.transparent

  ),
};