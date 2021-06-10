import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';

import 'generic_form_control.dart';

class HospedeFormControl extends FormControl {
  HospedeFormControl(Hospede hospede) : super(HospedeService(), item: hospede) {
    if (hospede != null) {
      formData["id"] = hospede.id;
      formData["nome"] = hospede.nome;
      formData["cpf"] = hospede.cpf;
      formData["email"] = hospede.email;
      formData["endereco"] = hospede.endereco;
    }
  }

  Hospede get hospede => item;

  Hospede submit() {
    if (formKey.currentState.validate()) {
      item = Hospede.fromMap(formData);
      super.submit();
    }
    return null;
  }
}
