import 'package:flutter/material.dart';

// import 'storage_manager.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    hintColor: const Color(0xFFC1AACD),
    primaryColor: const Color(0xFFE5D8ED),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    iconTheme: const IconThemeData(color: Colors.white),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      toolbarHeight: 60,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Color(0xFF3B1A4D), size: 20),
      actionsIconTheme: IconThemeData(color: Color(0xFF3B1A4D), size: 35),
      titleTextStyle: TextStyle(
          color: Color(0xFF3B1A4D), fontSize: 24, fontWeight: FontWeight.w500),
    ),
    popupMenuTheme: PopupMenuThemeData(
      surfaceTintColor: const Color(0xFF3B1A4D).withOpacity(0.7),
      shadowColor: const Color(0xFFC1AACD).withOpacity(0.1),
      color: const Color(0xFFE5D8ED).withOpacity(0.5),
      textStyle: const TextStyle(
        color: Color(0xFF3B1A4D),
        fontSize: 12,
        fontWeight: FontWeight.w100,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF3B1A4D),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Color(0xFF3B1A4D),
        fontSize: 15,
        fontWeight: FontWeight.w100,
      ),
      displaySmall: TextStyle(
        color: Color(0xFF3B1A4D),
        fontSize: 12,
        fontWeight: FontWeight.w100,
      ),
      headlineLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3B1A4D),
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3B1A4D),
      ),
      headlineSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFF3B1A4D),
      ),
      labelSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Color(0xFFC1AACD),
      ),
    ),
    hoverColor: const Color(0xffD3D3D3),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        hoverElevation: 5, splashColor: Color(0xFF3B1A4D)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xFF3B1A4D),
    ),
    buttonTheme: const ButtonThemeData(
      hoverColor: Color(0xffD3D3D3),
      buttonColor: Color(0xFF3B1A4D),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFF252D38),
      hintColor: const Color(0xFF254674),
      scaffoldBackgroundColor: const Color(0xFF161C24),
      colorScheme: const ColorScheme.dark(),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 60,
        backgroundColor: Color(0xFF161C24),
        iconTheme: IconThemeData(color: Color(0xFFFAF9FB), size: 20),
        actionsIconTheme: IconThemeData(color: Color(0xffD3D3D3), size: 35),
        titleTextStyle: TextStyle(
            color: Color(0xffD3D3D3),
            fontSize: 24,
            fontWeight: FontWeight.w500),
      ),
      popupMenuTheme: PopupMenuThemeData(
        surfaceTintColor: const Color(0xFFFAF9FB).withOpacity(0.7),
        shadowColor: const Color(0xFF254674).withOpacity(0.1),
        color: const Color(0xFF252D38).withOpacity(0.5),
        textStyle: const TextStyle(
          color: Color(0xFF3B1A4D),
          fontSize: 12,
          fontWeight: FontWeight.w100,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xffD3D3D3),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Color(0xffD3D3D3),
          fontSize: 15,
          fontWeight: FontWeight.w300,
        ),
        displaySmall: TextStyle(
          color: Color(0xffD3D3D3),
          fontSize: 12,
          fontWeight: FontWeight.w100,
        ),
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xffD3D3D3),
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xffD3D3D3),
        ),
        headlineSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xffD3D3D3),
        ),
        labelSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color(0xFF254674),
        ),
      ),
      hoverColor: const Color(0xffD3D3D3),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          hoverElevation: 5, splashColor: Color(0xffD3D3D3)),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Color(0xffD3D3D3),
      ),
      buttonTheme: const ButtonThemeData(
          hoverColor: Color(0xffD3D3D3), buttonColor: Color(0xffD3D3D3)));
}
