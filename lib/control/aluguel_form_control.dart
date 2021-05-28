import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AluguelFormControl{
  final GlobalKey<FormBuilderState> _formKey;
  ImovelService _imovelService = ImovelService();
  HospedeService _hospedeService = HospedeService();
  AluguelService _aluguelService = AluguelService();

  AluguelFormControl(this._formKey);

  Map<String, dynamic> formData = Map<String, dynamic>();

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  Future<List<Hospede>> getHospedes() async {
    return await _hospedeService.getAll();
  }

  void onChange(String key, dynamic val){
    formData[key] = val;
    print(formData[key].runtimeType);
  }

  Aluguel registerAluguel(){
    if (_formKey.currentState.validate()) {
      formData["checkin"] = formData["periodo"].start;
      formData["checkout"] = formData["periodo"].end;
      final despesa = Aluguel.fromMap(formData);
      _aluguelService.create(despesa).then((value) => print(value));
    }
    return null;
  }
}