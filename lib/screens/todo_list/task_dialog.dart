import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class NewTaskDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  final String description;
  final String fieldName = "descricao";

  NewTaskDialog({this.description});

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
              fieldName,
              initialValue: description,
              hint: "Digite aqui",
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
                      Navigator.pop(context, form.fields[fieldName].value);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
