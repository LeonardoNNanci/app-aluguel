import 'package:aluguel/control/hospede_form_control.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: must_be_immutable
class HospedeForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  HospedeFormControl _control;

  HospedeForm(){
    _control = HospedeFormControl(_formKey);
  }

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
            key: _formKey,
            child: Column(
              children: [
                KeyboardInputField(
                  "nome",
                  label: "Nome",
                  icon: Icons.person,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                ),
                KeyboardInputField(
                  "cpf",
                  label: "CPF",
                  icon: Icons.fingerprint,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                ),
                KeyboardInputField(
                  "email",
                  label: "E-mail",
                  icon: Icons.email,
                  validations: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context),
                  ],
                ),
                KeyboardInputField(
                  "endereco",
                  label: "Endereço",
                  icon: Icons.home_work,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                ),
                ElevatedButton(
                  onPressed: _control.registerHospede,
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
