import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HospedeFormControl{
  final GlobalKey<FormBuilderState> _formKey;
  HospedeService _service = HospedeService();

  HospedeFormControl(this._formKey);

  Hospede registerHospede(){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_formKey.currentState.value);
      final formData = _formKey.currentState.value;
      final hospede = Hospede.fromMap(formData);
      _service.create(hospede).then((value) => print(value));
    }
    return null;
  }
}