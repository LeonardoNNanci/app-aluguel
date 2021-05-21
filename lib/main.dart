import 'package:flutter/material.dart';

import 'package:aluguel/screens/todo_list/todo_list.dart';

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
      home: ToDo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
