import 'package:aluguel/control/forms/aluguel_form_control.dart';
import 'package:aluguel/widgets/feedback/error_feedback.dart';
import 'package:aluguel/widgets/feedback/loading_feedback.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' as intl;

// ignore: must_be_immutable
class AluguelForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  AluguelFormControl _control;

  AluguelForm() {
    _control = AluguelFormControl(_formKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Aluguel"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
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
                              items: snapshot.data
                                  .map<DropdownMenuItem>((e) => DropdownMenuItem(
                                        child: Text(e.local),
                                        value: e.id,
                                      ))
                                  .toList(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              decoration: InputDecoration(
                                labelText: "Imóvel",
                                icon: Icon(Icons.home_work),
                              ),
                              onChanged: (val) => _control.onChange("imovel_id", val),
                            );
                            break;
                        }
                        return ErrorFeedback();
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FutureBuilder(
                      future: _control.getHospedes(),
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
                              name: "hospede_id",
                              items: snapshot.data
                                  .map<DropdownMenuItem>((e) => DropdownMenuItem(
                                        child: Text(e.nome),
                                        value: e.id,
                                      ))
                                  .toList(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              decoration: InputDecoration(
                                  labelText: "Hóspede",
                                  icon: Icon(Icons.person)),
                              onChanged: (val) => _control.onChange("hospede_id", val),
                            );
                            break;
                        }
                        return ErrorFeedback();
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderDateRangePicker(
                    name: "periodo",
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2030),
                    format: intl.DateFormat("dd/MM/yyyy"),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    decoration: InputDecoration(
                      labelText: "Período",
                      icon: Icon(Icons.calendar_today),
                    ),
                    onChanged: (dtr) => _control.onChange("periodo", dtr),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: KeyboardInputField(
                        "total_hospedes",
                        label: "Total de Hóspedes",
                        icon: Icons.people,
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.integer(context),
                          FormBuilderValidators.min(context, 1),
                        ],
                        onChanged: (val) => _control.onChange("total_hospedes", int.parse(val)),
                      ),
                    ),
                    Expanded(
                      child: KeyboardInputField(
                        "valor",
                        label: "Valor",
                        icon: Icons.attach_money,
                        keyboardType: TextInputType.number,
                        validations: [
                          FormBuilderValidators.required(context),
                          FormBuilderValidators.numeric(context),
                          FormBuilderValidators.min(context, 0),
                        ],
                        onChanged: (val) => _control.onChange("valor", double.parse(val)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderSwitch(
                    name: "roupa_de_cama",
                    initialValue: false,
                    title: Text("Roupa de cama"),
                    decoration: InputDecoration(
                      icon: Icon(Icons.local_laundry_service),
                    ),
                    onChanged: (val) => _control.onChange("roupa_de_cama", val),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderChoiceChip(
                    name: "forma",
                    options: [
                      FormBuilderFieldOption(
                        value: "airbnb",
                        child: Text("airbnb"),
                      ),
                      FormBuilderFieldOption(
                        value: "at",
                        child: Text("Alugue Temporada"),
                      ),
                      FormBuilderFieldOption(
                        value: "direto",
                        child: Text("Direto"),
                      ),
                    ],
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: WrapAlignment.center,
                    decoration: InputDecoration(labelText: "Forma"),
                    onChanged: (val) => _control.onChange("forma", val),
                  ),
                ),
                KeyboardInputField(
                  "observacao",
                  label: "Observações",
                  onChanged: (val) => _control.onChange("observacao", val),
                ),
                ElevatedButton(
                  onPressed: () => _control.submit,
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
