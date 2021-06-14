import 'package:aluguel/models/abstract_model.dart';
import 'package:aluguel/service/general_service.dart';
import 'package:flutter/material.dart';

abstract class ReviewControl<T extends AbstractModel> {
  final Service service;
  final String editScreen;
  AbstractModel item;

  ReviewControl(this.service, this.editScreen);

  openEditScreen(BuildContext context) async {
    return await Navigator.pushNamed(context, editScreen, arguments: item);
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
    ).then((confirmedRemove) {
      if (confirmedRemove) {
        service.remove(item);
        Navigator.pop(context);
      }
    });
  }
}
