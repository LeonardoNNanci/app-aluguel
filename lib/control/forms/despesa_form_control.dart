import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';

import 'generic_form_control.dart';

class DespesaFormControl extends FormControl {
  ImovelService _imovelService = ImovelService();

  DespesaFormControl(Despesa despesa) : super(DespesaService(), item: despesa){
    if(despesa != null){
      formData["id"] = despesa.id;
      formData["servico"] = despesa.servico;
      formData["imovel_id"] = despesa.imovelId;
      formData["date"] = despesa.date;
      formData["valor"] = despesa.valor;
    }
  }

  Despesa get despesa => item;

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  Despesa submit() {
    if (formKey.currentState.validate()) {
      formData["date"] = formData["date"].toString();
      item = Despesa.fromMap(formData);
      super.submit();
    }
    return null;
  }
}
