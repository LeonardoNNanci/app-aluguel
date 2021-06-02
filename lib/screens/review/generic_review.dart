import 'package:aluguel/control/review/generic_review_control.dart';
import 'package:aluguel/style/default_icons.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  final String title;
  final ReviewControl control;
  final Widget body;

  const ReviewScreen({
    Key key,
    this.title,
    this.control,
    this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: DefaultIcons.edit,
            onPressed: () => control.openEditScreen(context),
          ),
          IconButton(
            icon: DefaultIcons.remove,
            onPressed: () => control.remove(context),
          )
        ],
      ),
      body: body,
    );
  }
}
