import 'package:aluguel/control/imovel_form_control.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: must_be_immutable
class ImovelForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  ImovelFormControl _control;

  ImovelForm(){
    _control = ImovelFormControl(_formKey);
  }

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
                        "max_hospedes",
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
                        "tarifa_padrao",
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
                        "desconto_semana",
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
                        "desconto_mes",
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
                  onPressed: _control.cadastrarImovel,
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
