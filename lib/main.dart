import 'package:aluguel/config/routes.dart';
import 'package:aluguel/style/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Aluguel',
      theme: appTheme,
      initialRoute: '/',
      routes: routes(context),
      debugShowCheckedModeBanner: false,
    );
  }
}
