import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:aluguel/models/task.dart';
import 'package:aluguel/screens/home/todo_list/task_dialog.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Function(Task) onDelete;
  final Function(Task) onCheck;
  final Function(Task) onEdit;

  final Color checkedColor = Colors.black26;

  const TaskCard({
    Key key,
    this.task,
    this.onDelete,
    this.onCheck,
    this.onEdit,
  }) : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  Task task;

  @override
  void initState() {
    super.initState();
    task = widget.task;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: task.checked,
      onChanged: (value) {
        setState(() {
          task.checked = value;
          task.checkTime = DateTime.now().toLocal();
        });
        widget.onCheck(task);
      },
      title: Text(
        task.description,
        style: task.checked
            ? TextStyle(
                color: widget.checkedColor,
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
      subtitle: task.checked
          ? Text(_formattedCheckTime(),
              style: TextStyle(
                color: widget.checkedColor,
              ))
          : null,
      secondary: DropdownButton<void Function()>(
          onChanged: (func) => func(),
          icon: const Icon(Icons.more_vert),
          underline: Container(),
          items: [
            DropdownMenuItem(
              value: _editTask,
              child: Text("Editar"),
            ),
            DropdownMenuItem(
              value: () => widget.onDelete(task),
              child: Text("Remover"),
            ),
          ]),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  void _editTask() {
    showDialog(
        context: context,
        builder: (context) => NewTaskDialog(
              description: task.description,
            )).then((taskDescription) {
      if (taskDescription != null) {
        setState(() {
          task.description = taskDescription;
        });
        widget.onEdit(task);
      }
    });
  }

  String _formattedCheckTime() {
    NumberFormat formatter = NumberFormat("00");
    return "${formatter.format(task.checkTime.hour)}:"
        "${formatter.format(task.checkTime.minute)} - "
        "${formatter.format(task.checkTime.day)}/"
        "${formatter.format(task.checkTime.month)}/"
        "${formatter.format(task.checkTime.year)}";
  }
}
