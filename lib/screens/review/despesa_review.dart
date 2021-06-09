import 'package:aluguel/control/review/despesa_review_control.dart';
import 'package:aluguel/screens/review/generic_review.dart';
import 'package:aluguel/widgets/feedback/error_feedback.dart';
import 'package:aluguel/widgets/feedback/loading_feedback.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DespesaReview extends StatelessWidget {
  DespesaReviewControl _control;

  DespesaReview(despesa, {Key key}) : super(key: key) {
    _control = DespesaReviewControl(despesa);
  }

  @override
  Widget build(BuildContext context) {
    return ReviewScreen(
      title: _control.despesa.servico,
      control: _control,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: _control.getImovelName(),
            builder: (context, snapshot) {
              switch(snapshot.connectionState){
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
          Text("Valor: ${_control.despesa.valor}"),
          Text("Data: ${_control.despesa.date.toString()}"),
        ],
      ),
    );
  }
}
