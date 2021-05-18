import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/screens/todo_list.dart';
import 'package:aluguel/util/json_io.dart';
import 'package:aluguel/widgets/feedback_info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: TodoList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
