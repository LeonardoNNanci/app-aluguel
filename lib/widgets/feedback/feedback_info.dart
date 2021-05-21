import "package:flutter/material.dart";

class FeedbackInfo extends StatelessWidget {
  final Widget child;
  final Widget legend;

  const FeedbackInfo({Key key, this.child, this.legend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Center(child: child), if (legend != null) legend],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
}
