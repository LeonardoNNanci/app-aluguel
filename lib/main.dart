import 'package:aluguel/config/sqflite/config.dart';
import 'package:aluguel/config/sqflite/database.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/screens/forms/aluguel_form.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:aluguel/style/appTheme.dart';
import 'package:flutter/material.dart';

import 'package:aluguel/screens/todo_list/todo_list.dart';

void main() {
  runApp(MyApp());
  final s = DespesaService();
  s.getAll().then((value) => print(value));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: Placeholder(),
    );
  }
}
