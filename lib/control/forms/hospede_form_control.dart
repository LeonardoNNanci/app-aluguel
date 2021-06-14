import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:flutter/cupertino.dart';

import 'generic_form_control.dart';

class HospedeFormControl extends FormControl {
  HospedeFormControl() : super(HospedeService());

  Hospede get hospede => item;

  set hospede(Hospede hospede) {
    if (hospede == null) return null;
    forUpdate = true;
    item = hospede;
    formData["id"] = hospede.id;
    formData["nome"] = hospede.nome;
    formData["cpf"] = hospede.cpf;
    formData["email"] = hospede.email;
    formData["endereco"] = hospede.endereco;
  }

  Hospede submit(BuildContext context) {
    if (formKey.currentState.validate()) {
      item = Hospede.fromMap(formData);
      super.submitAndRedirect(context, 'hospede');
    }
    return null;
  }
}
