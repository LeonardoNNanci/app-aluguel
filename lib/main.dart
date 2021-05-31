import 'package:aluguel/screens/home.dart';
import 'package:aluguel/screens/todo_list/todo_list.dart';
import 'package:aluguel/style/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: Home(),
    );
  }
}
