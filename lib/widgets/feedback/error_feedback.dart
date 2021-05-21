import 'package:flutter/material.dart';

import 'package:aluguel/widgets/feedback_info.dart';

class ErrorFeedback extends StatelessWidget {
  const ErrorFeedback({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedbackInfo(
      legend: Column(
        children: [
          Text("Aconteceu algo inesperado."),
          Text("Informe o Léo."),
        ],
      ),
      child: Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 104,
      ),
    );
  }
}
