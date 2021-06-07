import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_form_control.dart';

class AluguelFormControl extends FormControl{
  ImovelService _imovelService = ImovelService();
  HospedeService _hospedeService = HospedeService();
  AluguelService _aluguelService = AluguelService();

  AluguelFormControl();

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
      final despesa = Aluguel.fromMap(formData);
      _aluguelService.create(despesa).then((value) => print(value));
    }
    return null;
  }
}
