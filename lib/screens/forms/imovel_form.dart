import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:aluguel/control/forms/imovel_form_control.dart';

// ignore: must_be_immutable
class ImovelForm extends StatelessWidget {

  final _control = ImovelFormControl();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _control.formKey,
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
                  onChanged: (val) => _control.onChange("local", val),
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
                        onChanged: (val) =>
                            _control.onChange("max_hospedes", int.parse(val)),
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
                        onChanged: (val) => _control.onChange(
                            "tarifa_padrao", double.parse(val)),
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
                        onChanged: (val) => _control.onChange(
                            "desconto_semana", double.parse(val)),
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
                        onChanged: (val) => _control.onChange(
                            "desconto_mes", double.parse(val)),
                      ),
                    ),
                  ],
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
