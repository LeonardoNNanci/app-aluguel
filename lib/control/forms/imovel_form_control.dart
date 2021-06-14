import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/material.dart';

import 'generic_form_control.dart';

class ImovelFormControl extends FormControl {
  ImovelFormControl() : super(ImovelService());

  Imovel get imovel => item;

  set imovel(Imovel imovel) {
    if (imovel == null) return null;
    forUpdate = true;
    item = imovel;
    formData["id"] = imovel.id;
    formData["local"] = imovel.local;
    formData["max_hospedes"] = imovel.maxHospedes;
    formData["tarifa_padrao"] = imovel.tarifaPadrao;
    formData["desconto_semana"] = imovel.descontoSemana;
    formData["desconto_mes"] = imovel.descontoMes;
  }

  Imovel submit(BuildContext context) {
    if (formKey.currentState.validate()) {
      item = Imovel.fromMap(formData);
      super.submitAndRedirect(context, 'imovel');
    }
    return null;
  }
}
