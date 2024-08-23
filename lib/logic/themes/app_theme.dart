import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'SpaceGrotesk',
    // primaryColor: Color(0xFF910212),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        background: Color(0xFFF6F6F6),
        onBackground: Color(0xFF121212),
        primary: Color(0xFF910212),
        onPrimary: Colors.white,
        secondary: Color(0xFF121212),
        onSecondary: Colors.white,
        error: Color(0xFF121212),
        onError: Color(0xFF121212),
        surface: Colors.white,
        onSurface: Color(0xFF121212)),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF121212), fontSize: 18),
      bodyLarge: TextStyle(color: Color(0xFF121212), fontSize: 20),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Color(0xFF121212)),
      centerTitle: false,
      elevation: 0,
    ),
    cardTheme: CardTheme(margin:const EdgeInsets.all(8),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    iconTheme: IconThemeData(),
    // primarySwatch:Color(0xFF910212),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,
    fontFamily: 'SpaceGrotesk',
    // primaryColor: Color(0xFF910212),
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        background: Color(0xFF412121),
        onBackground: Color(0xFF121212),
        primary: Color(0xFFBBBBB),
        onPrimary: Colors.white,
        secondary: Color(0xFF121212),
        onSecondary: Colors.white,
        error: Color(0xFF121212),
        onError: Color(0xFF121212),
        surface: Colors.white,
        onSurface: Color(0xFF121212),
    ),
    cardTheme: CardTheme(margin:const EdgeInsets.all(8),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Color(0xFF121212), fontSize: 18),
      bodyLarge: TextStyle(color: Color(0xFF121212), fontSize: 20),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Color(0xFF121212)),
      centerTitle: false,
      elevation: 0,
    ),
    iconTheme: IconThemeData(),
    // primarySwatch:Color(0xFF910212),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
