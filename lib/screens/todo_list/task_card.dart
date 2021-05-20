import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  final bool checked;
  final String description;
  final Function(String, bool, DateTime) onDelete;
  final Function(String, bool, DateTime) onCheck;
  final Function(String, bool, DateTime) onEdit;

  const TaskCard(
      {Key key,
      this.checked,
      this.description,
      this.onDelete,
      this.onCheck,
      this.onEdit})
      : super(key: key);

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
    description = widget.description;
    checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      onChanged: (value) {
        setState(() {
          checked = value;
          checkTime = DateTime.now();
        });
        widget.onCheck(description, checked, checkTime);
      },
      title: Text(
        widget.description,
        style: checked
            ? TextStyle(
                color: Colors.black12,
                decoration: TextDecoration.lineThrough,
              )
            : null,
      ),
      secondary: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => widget.onDelete(description, checked, checkTime),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
