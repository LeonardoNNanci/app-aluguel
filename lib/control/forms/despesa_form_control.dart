import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_form_control.dart';

class DespesaFormControl extends FormControl {
  DespesaService _despesaService = DespesaService();
  ImovelService _imovelService = ImovelService();

  DespesaFormControl();

  Future<List<Imovel>> getImoveis() async {
    return await _imovelService.getAll();
  }

  Despesa submit() {
    if (formKey.currentState.validate()) {
      final despesa = Despesa.fromMap(formData);
      _despesaService.create(despesa).then((value) => print(value));
    }
    return null;
  }
}
