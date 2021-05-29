import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AluguelFormControl {
  final GlobalKey<FormBuilderState> _formKey;
  ImovelService _imovelService = ImovelService();
  HospedeService _hospedeService = HospedeService();
  AluguelService _aluguelService = AluguelService();

  Map<String, dynamic> _formData = Map<String, dynamic>();

  AluguelFormControl(this._formKey);

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  Future<List<Hospede>> getHospedes() async {
    return await _hospedeService.getAll();
  }

  void onChange(String key, dynamic val) {
    _formData[key] = val;
  }

  Aluguel registerAluguel() {
    if (_formKey.currentState.validate()) {
      _formData["checkin"] = _formData["periodo"].start;
      _formData["checkout"] = _formData["periodo"].end;
      final despesa = Aluguel.fromMap(_formData);
      _aluguelService.create(despesa).then((value) => print(value));
    }
    return null;
  }
}
