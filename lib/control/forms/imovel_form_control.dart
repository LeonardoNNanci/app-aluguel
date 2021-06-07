import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_form_control.dart';

class ImovelFormControl extends FormControl{
  ImovelService _service = ImovelService();

  ImovelFormControl();

  Imovel submit() {
    if (formKey.currentState.validate()) {
      final imovel = Imovel.fromMap(formData);
      _service.create(imovel).then((value) => print(value));
    }
    return null;
  }
}
