import 'package:aluguel/config/date_format.dart';
import 'package:aluguel/control/review/aluguel_review_control.dart';
import 'package:aluguel/screens/review/generic_review.dart';
import 'package:aluguel/widgets/feedback/error_feedback.dart';
import 'package:aluguel/widgets/feedback/loading_feedback.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AluguelReview extends StatelessWidget {
  final AluguelReviewControl _control = AluguelReviewControl();

  @override
  Widget build(BuildContext context) {
    _control.aluguel = ModalRoute.of(context).settings.arguments;

    return ReviewScreen(
      title: "Aluguel",
      control: _control,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: _control.getImovelName(),
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
                  return Text("Imóvel: ${snapshot.data}");
                  break;
              }
              return ErrorFeedback();
            },
          ),
          FutureBuilder(
            future: _control.getHospedeName(),
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
                  return Text("Valor: ${snapshot.data}");
                  break;
              }
              return ErrorFeedback();
            },
          ),
          Text("Checkin: ${DDMMYY.format(_control.aluguel.checkin)}"),
          Text("Checkin: ${DDMMYY.format(_control.aluguel.checkout)}"),
          Text("Hóspedes: ${_control.aluguel.totalHospedes}"),
          Text("Valor: ${_control.aluguel.valor}"),
          Text(
              "Roupa de cama: ${_control.aluguel.roupaDeCama ? "sim" : "não"}"),
          Text("Forma: ${_control.aluguel.forma}"),
          _control.aluguel.observacao == null
              ? Container()
              : Text("Observação: ${_control.aluguel.observacao}"),
        ],
      ),
    );
  }
}
