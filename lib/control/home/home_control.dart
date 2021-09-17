import 'package:aluguel/models/task.dart';
import 'package:aluguel/screens/home/todo_list/task_dialog.dart';
import 'package:aluguel/screens/home/todo_list/todo_list.dart';
import 'package:flutter/material.dart';

class HomeControl {
  List<Widget> addAction(screen, context) {
    if (screen.runtimeType != ToDo) return [];
    return [
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () =>
            showDialog(context: context, builder: (context) => NewTaskDialog())
                .then((taskDescription) {
          if (taskDescription != null) {
            final task = Task(taskDescription, false, DateTime.now());
            screen.taskListKey.currentState.addTask(task);
          }
        }),
      )
    ];
  }

  void openScreen(BuildContext context, String route){
    Navigator.pop(context);
    Navigator.pushNamed(context, route);
  }
}
