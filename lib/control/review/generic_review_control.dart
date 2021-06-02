import 'package:aluguel/models/abstract_model.dart';
import 'package:aluguel/service/general_service.dart';
import 'package:flutter/material.dart';

abstract class ReviewControl<T extends AbstractModel> {
  final Service service;
  final Widget editScreen;
  final T _item;

  ReviewControl(this.service, this.editScreen, this._item);

  openEditScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => editScreen),
    );
  }

  remove(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text("Tem certeza que deseja remover?"),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SimpleDialogOption(
                child: Text("Cancelar"),
                onPressed: () => Navigator.pop(context, false),
              ),
              SimpleDialogOption(
                child: ElevatedButton(
                    child: Text(
                      "Remover",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: () {
                      Navigator.pop(context, true);
                    }),
              ),
            ],
          ),
        ],
      ),
    ).then(
        (confirmedRemove) => confirmedRemove ? service.remove(_item) : null);
  }
}
