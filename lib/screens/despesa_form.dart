import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/widgets/keyboard_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:aluguel/models/imovel.dart';

class DespesaForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  // TODO remove hardcoded Imoveis after persistence
  final _imoveis = [
    Imovel("Itaipava", 8, 500, 7, 15),
    Imovel("Araruama", 8, 500, 7, 15),
  ];

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
                      ),
                    ),
                    Expanded(
                      child: FormBuilderDropdown(
                        name: "imovel",
                        decoration: InputDecoration(
                          labelText: "Imóvel",
                          icon: Icon(Icons.home_work),
                        ),
                        validator: FormBuilderValidators.compose(
                            [FormBuilderValidators.required(context)]),
                        allowClear: true,
                        items: _imoveis
                            .map((e) => DropdownMenuItem(
                                  child: Text(e.local),
                                  value: e,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
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

  Despesa _submit(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(_formKey.currentState.value);
    }
    return null;
  }
}
