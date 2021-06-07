import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';

import 'generic_form_control.dart';

class HospedeFormControl extends FormControl {
  HospedeService _service = HospedeService();

  HospedeFormControl();

  Hospede submit(){
    if (formKey.currentState.validate()) {
      final hospede = Hospede.fromMap(formData);
      _service.create(hospede).then((value) => print(value));
    }
    return null;
  }
}