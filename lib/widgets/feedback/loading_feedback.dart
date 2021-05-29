import 'package:aluguel/widgets/feedback/feedback_info.dart';
import 'package:flutter/material.dart';

class LoadingFeedback extends StatelessWidget {
  const LoadingFeedback({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FeedbackInfo(
      child: CircularProgressIndicator(),
      legend: Text("Carregando dados..."),
    );
  }
}
