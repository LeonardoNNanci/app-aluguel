import 'package:aluguel/widgets/feedback/loading_feedback.dart';
import 'package:flutter/material.dart';

import 'package:aluguel/models/task.dart';
import 'package:aluguel/screens/home/todo_list/task_card.dart';
import 'package:aluguel/screens/home/todo_list/task_dialog.dart';
import 'package:aluguel/util/json_io.dart';
import 'package:aluguel/widgets/feedback/error_feedback.dart';
import 'package:aluguel/widgets/feedback/feedback_info.dart';

final String _noDataLegend = "Ainda não há anotações por aqui...";

class ToDo extends StatelessWidget {
  final file = JsonFile("todo.txt");
  final taskListKey = GlobalKey<_TaskListState>();

  ToDo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: file.readData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return LoadingFeedback();
              break;
            case ConnectionState.done:
              List<Task> tasks = snapshot.data
                  .map<Task>((elem) => Task.fromMap(elem))
                  .toList();
              tasks.sort((a, b) => a.compareTo(b));
              return TaskList(
                key: taskListKey,
                file: file,
                tasks: tasks,
              );
              break;

            case ConnectionState.none:
              break;
            case ConnectionState.active:
              break;
          }
          return ErrorFeedback();
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed:,
      // ),
      // floatingActionButtonLocation: null,
    );
  }

  Widget addButton(BuildContext context){
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () => showDialog(
          context: context,
          builder: (context) => NewTaskDialog()).then((taskDescription) {
        if (taskDescription != null) {
          final task = Task(taskDescription, false, DateTime.now());
          taskListKey.currentState.addTask(task);
        }
      }),
    );
  }
}

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  final JsonFile file;

  TaskList({Key key, this.file, this.tasks}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();

  void saveData(List<Task> list) {
    final maps = list.map((e) => e.toMap()).toList();
    file.writeData(maps);
  }
}

class _TaskListState extends State<TaskList> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = widget.tasks;
  }

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty)
      return FeedbackInfo(
        child: Icon(
          Icons.list_alt_outlined,
          size: 96,
        ),
        legend: Text(_noDataLegend),
      );
    return ListView.builder(
      key: UniqueKey(),
      itemBuilder: (context, index) {
        return TaskCard(
          key: ObjectKey(tasks[index]),
          task: tasks[index],
          onCheck: (task) {
            setState(() {
              tasks[index] = task;
              tasks.sort((a,b) => a.compareTo(b));
            });
            widget.saveData(tasks);
          },
          onDelete: (task) {
            setState(() {
              tasks.removeAt(index);
            });
            widget.saveData(tasks);
          },
          onEdit: (task) {
            setState(() {
              tasks[index] = task;
              tasks.sort((a,b) => a.compareTo(b));
            });
            widget.saveData(tasks);
          },
        );
      },
      itemCount: tasks.length,
    );
  }

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
      tasks.sort((a,b) => a.compareTo(b));
    });
    widget.saveData(tasks);
  }
}
