import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HospedeFormControl{
  final GlobalKey<FormBuilderState> _formKey;
  HospedeService _service = HospedeService();

  Map<String, dynamic> _formData = Map<String, dynamic>();

  HospedeFormControl(this._formKey);

  void onChange(String key, dynamic val) {
    _formData[key] = val;
  }

  Hospede registerHospede(){
    if (_formKey.currentState.validate()) {
      final hospede = Hospede.fromMap(_formData);
      _service.create(hospede).then((value) => print(value));
    }
    return null;
  }
}