import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ImovelForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Novo Imovel"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                KeyboardInputField(
                  "local",
                  label: "Local",
                  icon: Icons.place,
                  validations: [
                    FormBuilderValidators.required(context),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: KeyboardInputField(
                        "hospedes",
                        label: "Hóspedes",
                        icon: Icons.account_circle,
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.integer(context),
                          FormBuilderValidators.min(context, 1),
                        ],
                      ),
                    ),
                    Expanded(
                      child: KeyboardInputField(
                        "tarifa",
                        label: "Tarifa",
                        icon: Icons.attach_money,
                        prefix: "R\$ ",
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.min(context, 0),
                        ],
                      ),
                    ),
                  ],
                ),
                Text("Descontos"),
                Row(
                  children: [
                    Expanded(
                      child: KeyboardInputField(
                        "semana",
                        label: "Semana",
                        icon: Icons.calendar_today_outlined,
                        suffix: "%",
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.min(context, 0),
                          FormBuilderValidators.max(context, 100),
                        ],
                      ),
                    ),
                    Expanded(
                      child: KeyboardInputField(
                        "mes",
                        label: "Mês",
                        icon: Icons.calendar_today,
                        suffix: "%",
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.min(context, 0),
                          FormBuilderValidators.max(context, 100),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: cadastrarImovel,
                  child: Text("Cadastrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Imovel cadastrarImovel() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_formKey.currentState.value);
    }
    return null;
  }
}
