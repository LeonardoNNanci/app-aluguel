import 'package:flutter/material.dart';

import 'feedback/error_feedback.dart';
import 'feedback/loading_feedback.dart';

class CustomFutureBuilder extends StatelessWidget {
  final Future<dynamic> future;
  final Widget Function(BuildContext, dynamic) onSuccess;

  const CustomFutureBuilder({Key key, this.future, this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
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
            return onSuccess(context, snapshot.data);
            break;
        }
        return ErrorFeedback();
      },
    );
  }
}
