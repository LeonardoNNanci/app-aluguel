import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_form_control.dart';

class ImovelFormControl extends FormControl {
  ImovelFormControl(Imovel imovel) : super(ImovelService(), item: imovel) {
    if (imovel != null) {
      formData["id"] = imovel.id;
      formData["local"] = imovel.local;
      formData["max_hospedes"] = imovel.maxHospedes;
      formData["tarifa_padrao"] = imovel.tarifaPadrao;
      formData["desconto_semana"] = imovel.descontoSemana;
      formData["desconto_mes"] = imovel.descontoMes;
    }
  }

  Imovel get imovel => item;

  Imovel submit() {
    if (formKey.currentState.validate()) {
      item = Imovel.fromMap(formData);
      super.submit();
    }
    return null;
  }
}
