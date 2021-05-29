import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ImovelFormControl {
  ImovelService _service = ImovelService();
  final GlobalKey<FormBuilderState> _formKey;

  Map<String, dynamic> _formData = Map<String, dynamic>();

  ImovelFormControl(this._formKey);

  void onChange(String key, dynamic val) {
    _formData[key] = val;
  }

  Imovel cadastrarImovel() {
    if (_formKey.currentState.validate()) {
      final imovel = Imovel.fromMap(_formData);
      _service.create(imovel).then((value) => print(value));
    }
    return null;
  }
}
