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

  FormControl(this.service, {this.item}){
    forUpdate = item != null;
  }

  dynamic initialValue(String key){
    return forUpdate ? formData[key] : null;
  }

  void onChange(String key, dynamic val) {
    formData[key] = val;
  }

  @mustCallSuper
  submit(){
    if (forUpdate) {
      service.update(item).then((value) => print(value));
    } else {
      service.create(item).then((value) => print(value));
    }
  }
}
