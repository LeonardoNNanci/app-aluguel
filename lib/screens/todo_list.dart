import 'package:aluguel/util/json_io.dart';
import 'package:aluguel/widgets/error_feedback.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:aluguel/widgets/feedback_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final file = CsvFile("todo.txt");

  List<dynamic> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de afazeres"),
      ),
      body: FutureBuilder(
        future: file.readData(),
        builder: _handleSnapshot,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
                  context: context,
                  builder: (BuildContext context) => NewTaskDialog())
              .then((itemValue) {
            if (itemValue != null) {
              setState(() {
                tasks.add({"description": itemValue, "crossed": false});
                file.writeData(tasks);
              });
            }
          });
        },
      ),
    );
  }

  Widget _handleSnapshot(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
          return FeedbackInfo(
            child: Text("Carregando infomações..."),
          );
        break;

      case ConnectionState.done:
        if (snapshot.data.length == 0)
          return ErrorFeedback();
          // return FeedbackInfo(
          //   child: Icon(
          //     Icons.warning_amber_rounded,
          //     size: 96,
          //   ),
          //   legend: Text("Ainda não há anotações por aqui..."),
          // );
        tasks = snapshot.data;
        return _showTasks();
        break;

      case ConnectionState.none:
        break;
      case ConnectionState.active:
        break;
    }

    return ErrorFeedback();
  }

  Widget _showTasks() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskCard(
            crossed: tasks[index]["crossed"],
            description: tasks[index]["description"],
            onCheck: () {
              this.tasks[index]["crossed"] = !this.tasks[index]["crossed"];
              file.writeData(tasks);
            },
            onDelete: () => this.setState(() {
                  tasks.removeAt(index);
                  file.writeData(tasks);
                }));
      },
      itemCount: tasks.length,
    );
  }
}

class NewTaskDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text("Nova tarefa"),
      children: [
        FormBuilder(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: KeyboardInputField(
              "descricao",
              validations: [FormBuilderValidators.required(context)],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SimpleDialogOption(
              child: Text("Cancelar"),
              onPressed: () => Navigator.pop(context),
            ),
            SimpleDialogOption(
              child: ElevatedButton(
                  child: Text(
                    "Confirmar",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate())
                      Navigator.pop(context, form.fields["descricao"].value);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}

class TaskCard extends StatefulWidget {
  @required
  final bool crossed;
  @required
  final String description;
  final Function onDelete;
  final Function onCheck;

  const TaskCard(
      {Key key, this.crossed, this.description, this.onDelete, this.onCheck})
      : super(key: key);

  @override
  _TaskCardState createState() => _TaskCardState(crossed);
}

class _TaskCardState extends State<TaskCard> {
  bool crossed;

  _TaskCardState(this.crossed);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Checkbox(
            value: crossed,
            onChanged: (checked) {
              setState(() {
                widget.onCheck();
                crossed = !crossed;
              });
            },
          ),
          title: Text(
            widget.description,
            style: crossed
                ? TextStyle(
                    color: Colors.black12,
                    decoration: TextDecoration.lineThrough,
                  )
                : null,
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: widget.onDelete,
          )),
    );
  }
}
