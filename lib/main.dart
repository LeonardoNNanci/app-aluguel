import 'package:aluguel/screens/forms/aluguel_form.dart';
import 'package:aluguel/style/appTheme.dart';
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
      theme: appTheme,
      home: ToDo(),
    );
  }
}
