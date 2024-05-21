import 'package:flutter/material.dart';
import 'package:todo_task/shared/styles/colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: mintGreen,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey,
    ),
    dividerTheme: DividerThemeData(color: primary, thickness: 3),
  );
  static ThemeData darkTheme = ThemeData();
}
