import 'package:aluguel/models/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Function(String, bool, DateTime) onDelete;
  final Function(String, bool, DateTime) onCheck;
  final Function(String, bool, DateTime) onEdit;

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
  String description;
  bool checked;
  DateTime checkTime;

  @override
  void initState() {
    super.initState();
    description = widget.task.description;
    checked = widget.task.checked;
    checkTime = widget.task.checkTime;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      onChanged: (value) {
        setState(() {
          checked = value;
          checkTime = DateTime.now().toLocal();
        });
        widget.onCheck(description, checked, checkTime);
      },
      title: Text(
        description,
        style: checked
            ? TextStyle(
                color: widget.checkedColor,
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
      subtitle: checked
          ? Text(_formattedCheckTime(),
              style: TextStyle(
                color: widget.checkedColor,
              ))
          : null,
      secondary: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => widget.onDelete(description, checked, checkTime),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  String _formattedCheckTime() {
    NumberFormat formatter = NumberFormat("00");
    return "${formatter.format(checkTime.hour)}:"
        "${formatter.format(checkTime.minute)} - "
        "${formatter.format(checkTime.day)}/"
        "${formatter.format(checkTime.month)}/"
        "${formatter.format(checkTime.year)}";
  }
}
