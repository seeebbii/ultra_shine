import 'package:flutter/material.dart';
import 'package:ultra_shine/app/utils/colors.dart';

ThemeData myTheme = ThemeData(
    primaryTextTheme: const TextTheme(
      headline5: TextStyle(
        fontFamily: 'Akira',
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        fontFamily: 'Avenir',
        fontSize: 14,
        color: Colors.black,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          fontFamily: 'Avenir',
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    ),
    primarySwatch: const MaterialColor(0xFFFFB703, color),
    primaryColor: primaryColor,
    accentColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    cardColor: primaryColor,
    dividerColor: primaryColor,
    focusColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: primaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Colors.white,
        primary: primaryColor,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: blue, elevation: 5));