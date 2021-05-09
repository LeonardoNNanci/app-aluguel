import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/util/validations.dart';
import 'package:aluguel/widgets/inputField.dart';
import 'package:flutter/material.dart';

class HospedeForm extends StatefulWidget {
  const HospedeForm({Key key}) : super(key: key);

  @override
  _HospedeFormState createState() => _HospedeFormState();
}

class _HospedeFormState extends State<HospedeForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController enderecoCtrl = TextEditingController();
  TextEditingController cpfCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Novo Hóspede"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InputField(
                  label: "Nome",
                  icon: Icons.person,
                  controller: nomeCtrl,
                  validations: [
                    Validations.nonEmpty,
                  ],
                ),
                InputField(
                  label: "CPF",
                  icon: Icons.fingerprint,
                  controller: cpfCtrl,
                  validations: [
                    Validations.nonEmpty,
                  ],
                ),
                InputField(
                  label: "email",
                  icon: Icons.email,
                  controller: emailCtrl,
                  validations: [
                    Validations.nonEmpty,
                  ],
                ),
                InputField(
                  label: "Endereço",
                  icon: Icons.home_work,
                  controller: enderecoCtrl,
                  validations: [
                    Validations.nonEmpty,
                  ],
                ),
                ElevatedButton(
                  onPressed: submit,
                  child: Text("Cadastrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Hospede submit(){
    if(_formKey.currentState.validate()){
      print(nomeCtrl.runtimeType);
      var nome = nomeCtrl.text;
      var cpf = cpfCtrl.text;
      var email = emailCtrl.text;
      var endereco = enderecoCtrl.text;
      var hospede = Hospede(nome, email, endereco, cpf);

      print(hospede);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Novo hospede: ' + hospede.nome + '.')));
    }
  }
}
