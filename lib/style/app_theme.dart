import 'package:flutter/material.dart';

final _primaryColor = Colors.deepPurple;

final appTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.deepPurple,
  cardColor: _primaryColor.shade100,

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _primaryColor.shade50,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.zero,
    ),
  ),
);
