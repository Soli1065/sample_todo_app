import 'package:flutter/material.dart';

ThemeData themeData = ThemeData.light().copyWith(bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.white,
),);

ThemeData themeDataDark = ThemeData.dark().copyWith(bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  backgroundColor: Colors.white,
),);