import 'package:aluguel/style/default_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:aluguel/control/forms/hospede_form_control.dart';

class HospedeForm extends StatelessWidget {
  final HospedeFormControl _control = HospedeFormControl();

  @override
  Widget build(BuildContext context) {
    _control.hospede = ModalRoute.of(context).settings.arguments;
    print(_control.hospede);
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
                  initialValue: _control.initialValue("nome"),
                  icon: DefaultIcons.hospede,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                  onChanged: (val) => _control.onChange("nome", val),
                ),
                KeyboardInputField(
                  "cpf",
                  label: "CPF",
                  initialValue: _control.initialValue("cpf"),
                  icon: Icons.fingerprint,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                  onChanged: (val) => _control.onChange("cpf", val),
                ),
                KeyboardInputField(
                  "email",
                  label: "E-mail",
                  initialValue: _control.initialValue("email"),
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
                  initialValue: _control.initialValue("endereco"),
                  icon: Icons.place,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                  onChanged: (val) => _control.onChange("endereco", val),
                ),
                ElevatedButton(
                  onPressed: () => _control.submit(context),
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
