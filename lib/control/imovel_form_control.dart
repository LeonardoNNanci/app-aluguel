import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ImovelFormControl {
  ImovelService service = ImovelService();
  final GlobalKey<FormBuilderState> _formKey;

  ImovelFormControl(this._formKey);

  Imovel cadastrarImovel() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final formData = _formKey.currentState.value;
      final imovel = Imovel.fromMap(formData);
      service.create(imovel).then((value) => print(value));
    }
    return null;
  }
}
