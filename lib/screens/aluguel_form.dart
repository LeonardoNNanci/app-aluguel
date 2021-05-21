import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart' as intl;

import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';

class AluguelForm extends StatefulWidget {
  @override
  _AluguelFormState createState() => _AluguelFormState();
}

class _AluguelFormState extends State<AluguelForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  final _imoveis = [
    Imovel("Itaipava", 8, 500, 7, 15),
    Imovel("Araruama", 8, 500, 7, 15),
  ];

  final _hospedes = [
    Hospede("João", "joão@email.com", "Rua do Jão", "13254679810"),
    Hospede("Clara", "joão@email.com", "Rua do Jão", "13254679810"),
    Hospede("Ana", "joão@email.com", "Rua do Jão", "13254679810"),
    Hospede("Anna", "joão@email.com", "Rua do Jão", "13254679810"),
    Hospede("Pedro", "joão@email.com", "Rua do Jão", "13254679810"),
  ];

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
                  child: FormBuilderDropdown(
                    name: "imovel",
                    items: _imoveis
                        .map((e) => DropdownMenuItem(
                              child: Text(e.local),
                              value: e,
                            ))
                        .toList(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    decoration: InputDecoration(
                      labelText: "Imóvel",
                      icon: Icon(Icons.home_work),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderDropdown(
                    name: "hospede",
                    items: _hospedes
                        .map((e) => DropdownMenuItem(
                              child: Text(e.nome),
                              value: e,
                            ))
                        .toList(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    decoration: InputDecoration(
                        labelText: "Hóspede", icon: Icon(Icons.person)),
                  ),
                ),
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
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: KeyboardInputField(
                        "hospedes",
                        label: "Total de Hóspedes",
                        icon: Icons.people,
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
                        "valor",
                        label: "Valor",
                        icon: Icons.attach_money,
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderSwitch(
                    name: "roupaDeCama",
                    initialValue: false,
                    title: Text("Roupa de cama"),
                    decoration: InputDecoration(
                      icon: Icon(Icons.local_laundry_service),
                    ),
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
                  ),
                ),
                KeyboardInputField(
                  "obs",
                  label: "Observações",
                ),
                ElevatedButton(
                  onPressed: _submit,
                  child: Text("Cadastrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Aluguel _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      print(form.value);
    }

    return null;
  }
}
