import 'package:flutter/material.dart';

const _primaryColor = Colors.blueGrey;

final appTheme = ThemeData(
  primarySwatch: _primaryColor,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: _primaryColor.shade50,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.zero,
    ),
  ),
);
