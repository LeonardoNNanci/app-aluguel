import 'package:aluguel/style/default_icons.dart';
import 'package:aluguel/util/custom_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:aluguel/control/forms/imovel_form_control.dart';

class ImovelForm extends StatelessWidget {
  final ImovelFormControl _control = ImovelFormControl();

  @override
  Widget build(BuildContext context) {
    _control.imovel = ModalRoute.of(context).settings.arguments;

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
                  initialValue: _control.initialValue("local"),
                  icon: DefaultIcons.imovel,
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
                        initialValue: toStringOrNull(
                            _control.initialValue("max_hospedes")),
                        icon: Icons.people,
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
                        initialValue: toStringOrNull(
                            _control.initialValue("tarifa_padrao")),
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
                        initialValue: toStringOrNull(
                            _control.initialValue("desconto_semana")),
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
                        initialValue: toStringOrNull(
                            _control.initialValue("desconto_mes")),
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
