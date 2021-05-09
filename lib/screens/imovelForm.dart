import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/util/validations.dart';
import 'package:aluguel/widgets/inputField.dart';
import 'package:flutter/material.dart';

class ImovelForm extends StatefulWidget {
  const ImovelForm({Key key}) : super(key: key);

  @override
  _ImovelFormState createState() => _ImovelFormState();
}

class _ImovelFormState extends State<ImovelForm> {
  final _formKey = GlobalKey<FormState>();

  var localCtrl = TextEditingController();
  var hospedesCtrl = TextEditingController();
  var tarifaCtrl = TextEditingController();
  var semanaCtrl = TextEditingController();
  var mesCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                InputField(
                  label: "Local",
                  hint: "Local",
                  icon: Icons.place,
                  controller: localCtrl,
                  validations: [
                    Validations.nonEmpty,
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        label: "Hóspedes",
                        icon: Icons.account_circle,
                        keyboardType: TextInputType.number,
                        controller: hospedesCtrl,
                        validations: [
                          Validations.nonEmpty,
                          Validations.nonNegativeInt,
                        ],
                      ),
                    ),
                    Expanded(
                      child: InputField(
                        label: "Tarifa",
                        icon: Icons.attach_money,
                        prefix: "R\$ ",
                        keyboardType: TextInputType.number,
                        controller: tarifaCtrl,
                        validations: [
                          Validations.nonEmpty,
                          Validations.nonNegativeDouble,
                        ],
                      ),
                    ),
                  ],
                ),
                Text("Descontos"),
                Row(
                  children: [
                    Expanded(
                      child: InputField(
                        label: "Semana",
                        icon: Icons.calendar_today_outlined,
                        suffix: "%",
                        keyboardType: TextInputType.number,
                        controller: semanaCtrl,
                        validations: [
                          Validations.nonEmpty,
                          Validations.percent0To100,
                        ],
                      ),
                    ),
                    Expanded(
                      child: InputField(
                        label: "Mês",
                        icon: Icons.calendar_today,
                        suffix: "%",
                        keyboardType: TextInputType.number,
                        controller: mesCtrl,
                        validations: [
                          Validations.nonEmpty,
                          Validations.percent0To100,
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
      var imovel = Imovel();
      imovel.local = localCtrl.text;
      imovel.maxHospedes = int.parse(hospedesCtrl.text);
      imovel.tarifaPadrao = double.parse(tarifaCtrl.text);
      imovel.descontoSemana = double.parse(semanaCtrl.text);
      imovel.descontoMes = double.parse(mesCtrl.text);
      print(imovel.local);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Novo imóvel em ' + imovel.local + '.')));
    }
    return null;
  }
}
