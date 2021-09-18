import 'package:flutter/material.dart';

final MaterialColor _primary = Colors.grey;
final MaterialColor _accent = Colors.amber;

final appTheme = ThemeData(
  primaryColor: _primary,
  primaryColorBrightness: Brightness.dark,
  primaryColorDark: _primary.shade900,
  accentColor: _accent,
  appBarTheme: AppBarTheme(
    backgroundColor: _primary.shade900,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: _primary.shade900,
    selectedItemColor: _accent,
    unselectedItemColor: _primary.shade50,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _primary.shade50,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.zero,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(_primary.shade800),
    ),
  ),

  cardTheme: CardTheme(color: _primary.shade50),
);
