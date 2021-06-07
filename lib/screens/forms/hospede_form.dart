import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:aluguel/control/forms/hospede_form_control.dart';

// ignore: must_be_immutable
class HospedeForm extends StatelessWidget {
  final _control = HospedeFormControl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Hóspede"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _control.formKey,
            child: Column(
              children: [
                KeyboardInputField(
                  "nome",
                  label: "Nome",
                  icon: Icons.person,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                  onChanged: (val) => _control.onChange("nome", val),
                ),
                KeyboardInputField(
                  "cpf",
                  label: "CPF",
                  icon: Icons.fingerprint,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                  onChanged: (val) => _control.onChange("cpf", val),
                ),
                KeyboardInputField(
                  "email",
                  label: "E-mail",
                  icon: Icons.email,
                  validations: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context),
                  ],
                  onChanged: (val) => _control.onChange("email", val),
                ),
                KeyboardInputField(
                  "endereco",
                  label: "Endereço",
                  icon: Icons.home_work,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                  onChanged: (val) => _control.onChange("endereco", val),
                ),
                ElevatedButton(
                  onPressed: _control.submit,
                  child: Text("Cadastrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
