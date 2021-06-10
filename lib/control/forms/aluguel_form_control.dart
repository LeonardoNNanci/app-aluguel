import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';

import 'generic_form_control.dart';

class AluguelFormControl extends FormControl {
  ImovelService _imovelService = ImovelService();
  HospedeService _hospedeService = HospedeService();

  AluguelFormControl(Aluguel aluguel) : super(AluguelService(), item: aluguel) {
    if (aluguel != null) {
      formData["id"] = aluguel.id;
      formData["valor"] = aluguel.valor;
      formData["forma"] = aluguel.forma;
      formData["imovel_id"] = aluguel.imovelId;
      formData["hospede_id"] = aluguel.hospedeId;
      formData["observacao"] = aluguel.observacao;
      formData["roupa_de_cama"] = aluguel.roupaDeCama;
      formData["total_hospedes"] = aluguel.totalHospedes;
      formData["periodo"] =
          DateTimeRange(start: aluguel.checkin, end: aluguel.checkout);
    } else {
      formData["roupa_de_cama"] = false;
    }
  }

  Aluguel get aluguel => item;

  DateTimeRange initialPeriodo() {
    if (item == null) return null;
    final range = DateTimeRange(start: aluguel.checkin, end: aluguel.checkout);
    return range;
  }

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  Future<List<Hospede>> getHospedes() async {
    return await _hospedeService.getAll();
  }

  Aluguel submit() {
    if (formKey.currentState.validate()) {
      formData["checkin"] = formData["periodo"].start.toString();
      formData["checkout"] = formData["periodo"].end.toString();
      item = Aluguel.fromMap(formData);
      super.submit();
    }
    return null;
  }
}
