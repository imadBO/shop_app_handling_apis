import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/shared/constants.dart';

final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: kPrimaryColor,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    // backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kPrimaryColor,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
  ),
);
final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black12,
  primarySwatch: kPrimaryColor,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black12,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: kPrimaryColor,
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    backgroundColor: Colors.black12,
    unselectedItemColor: Colors.grey,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
  ),
);
