import 'package:aluguel/widgets/feedback/error_feedback.dart';
import 'package:aluguel/widgets/feedback/loading_feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' as intl;

import 'package:aluguel/control/forms/despesa_form_control.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';

// ignore: must_be_immutable
class DespesaForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  DespesaFormControl _control;

  DespesaForm() {
    _control = DespesaFormControl(_formKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Despesa"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                KeyboardInputField(
                  "servico",
                  label: "Serviço",
                  icon: Icons.settings,
                  validations: [FormBuilderValidators.required(context)],
                  onChanged: (val) => _control.onChange("servico", val),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: _control.getImoveis(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          break;
                        case ConnectionState.waiting:
                          return LoadingFeedback();
                          break;
                        case ConnectionState.active:
                          break;
                        case ConnectionState.done:
                          return FormBuilderDropdown(
                            name: "imovel_id",
                            decoration: InputDecoration(
                              labelText: "Imóvel",
                              icon: Icon(Icons.home_work),
                            ),
                            validator: FormBuilderValidators.compose(
                                [FormBuilderValidators.required(context)]),
                            allowClear: true,
                            items: snapshot.data
                                .map<DropdownMenuItem>((e) => DropdownMenuItem(
                                      child: Text(e.local),
                                      value: e.id,
                                    ))
                                .toList(),
                            onChanged: (val) =>
                                _control.onChange("imovel_id", val),
                          );
                          break;
                      }
                      return ErrorFeedback();
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: KeyboardInputField(
                        "valor",
                        label: "Valor",
                        icon: Icons.attach_money,
                        prefix: "R\$ ",
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.min(context, 0),
                        ],
                        onChanged: (val) =>
                            _control.onChange("valor", double.parse(val)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FormBuilderDateTimePicker(
                          name: "date",
                          inputType: InputType.date,
                          validator: FormBuilderValidators.required(context),
                          onChanged: (val) =>
                              _control.onChange("date", val.toString()),
                          format: intl.DateFormat("dd/MM/yyyy"),
                          decoration: InputDecoration(
                            labelText: "Data",
                            icon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _control.registerDespesa,
                  child: Text("Cadastrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
