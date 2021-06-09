import 'package:aluguel/control/review/imovel_review_control.dart';
import 'package:aluguel/screens/review/generic_review.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImovelReview extends StatelessWidget {
  ImovelReviewControl _control;

  ImovelReview(imovel, {Key key}) : super(key: key) {
    _control = ImovelReviewControl(imovel);
  }

  @override
  Widget build(BuildContext context) {
    return ReviewScreen(
      title: _control.imovel.local,
      control: _control,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Número de hóspedes: ${_control.imovel.maxHospedes}"),
          Text("Tarifa padrão: ${_control.imovel.tarifaPadrao}"),
          Text("Desconto para semana: ${_control.imovel.descontoSemana}"),
          Text("Desconto para mês: ${_control.imovel.descontoMes}"),
        ],
      ),
    );
  }
}
