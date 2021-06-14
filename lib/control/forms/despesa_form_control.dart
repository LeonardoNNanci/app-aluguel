import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';

import 'generic_form_control.dart';

class DespesaFormControl extends FormControl {
  ImovelService _imovelService = ImovelService();

  DespesaFormControl() : super(DespesaService());

  Despesa get despesa => item;

  set despesa(Despesa despesa) {
    if (despesa == null) return null;
    forUpdate = true;
    formData["id"] = despesa.id;
    formData["servico"] = despesa.servico;
    formData["imovel_id"] = despesa.imovelId;
    formData["date"] = despesa.date;
    formData["valor"] = despesa.valor;
  }

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  Despesa submit(BuildContext context) {
    if (formKey.currentState.validate()) {
      formData["date"] = formData["date"].toString();
      item = Despesa.fromMap(formData);
      super.submitAndRedirect(context, 'despesa');
    }
    return null;
  }
}
