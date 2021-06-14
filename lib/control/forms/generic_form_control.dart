import 'package:aluguel/models/abstract_model.dart';
import 'package:aluguel/service/general_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

abstract class FormControl {
  final formKey = GlobalKey<FormBuilderState>();
  final formData = Map<String, dynamic>();
  bool forUpdate = false;
  final Service service;

  AbstractModel item;

  FormControl(this.service);

  dynamic initialValue(String key) {
    return forUpdate ? formData[key] : null;
  }

  void onChange(String key, dynamic val) {
    formData[key] = val;
  }

  submitAndRedirect(BuildContext context, String model) async {
    if (forUpdate) {
      item = await service.update(item);
      Navigator.pushNamedAndRemoveUntil(
          context, '/review/$model', ModalRoute.withName('/'),
          arguments: item);
    } else {
      item = await service.create(item);
      Navigator.popAndPushNamed(context, '/review/$model', arguments: item);
    }
  }
}
