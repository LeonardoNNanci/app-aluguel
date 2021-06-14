import 'package:aluguel/control/review/imovel_review_control.dart';
import 'package:aluguel/screens/review/generic_review.dart';
import 'package:flutter/material.dart';

class ImovelReview extends StatelessWidget {
  final ImovelReviewControl _control = ImovelReviewControl();

  @override
  Widget build(BuildContext context) {
    _control.imovel = ModalRoute.of(context).settings.arguments;

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
