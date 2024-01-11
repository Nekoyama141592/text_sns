import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme() => ThemeData.light()
      .copyWith(appBarTheme: const AppBarTheme(color: Colors.green));
  static ThemeData dartTheme() => ThemeData.dark()
      .copyWith(appBarTheme: const AppBarTheme(color: Colors.black));
}
