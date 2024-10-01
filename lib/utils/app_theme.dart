import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white
          )
      ),
      colorScheme: const ColorScheme.light(primary: Colors.red),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white
      )
  );

}