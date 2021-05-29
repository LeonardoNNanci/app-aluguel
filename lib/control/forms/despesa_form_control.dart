import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DespesaFormControl{
  final GlobalKey<FormBuilderState> _formKey;
  DespesaService _despesaService = DespesaService();
  ImovelService _imovelService = ImovelService();

  Map<String, dynamic> _formData = Map<String, dynamic>();

  DespesaFormControl(this._formKey);

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  void onChange(String key, dynamic val){
    _formData[key] = val;
  }

  Despesa registerDespesa(){
    if (_formKey.currentState.validate()) {
      final despesa = Despesa.fromMap(_formData);
      _despesaService.create(despesa).then((value) => print(value));
    }
    return null;
  }
}