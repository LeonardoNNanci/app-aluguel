import 'package:aluguel/control/review/hospede_review_control.dart';
import 'package:aluguel/screens/review/generic_review.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HospedeReview extends StatelessWidget {
  HospedeReviewControl _control;

  HospedeReview(hospede, {Key key}) : super(key: key) {
    _control = HospedeReviewControl(hospede);
  }

  @override
  Widget build(BuildContext context) {
    return ReviewScreen(
      title: _control.hospede.nome.split(" ")[0],
      control: _control,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nome: ${_control.hospede.nome}"),
          Text("CPF: ${_control.hospede.cpf}"),
          Text("Email: ${_control.hospede.email}"),
          Text("Endereço: ${_control.hospede.endereco}"),
        ],
      ),
    );
  }
}
