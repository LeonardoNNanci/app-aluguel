import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/screens/forms/despesa_form.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';

import 'generic_review_control.dart';

class DespesaReviewControl extends ReviewControl {

  final imovelService = ImovelService();
  final Despesa despesa;

  DespesaReviewControl(this.despesa)
      : super(DespesaService(), DespesaForm(despesa: despesa), despesa);

  Future<String> getImovelName() async {
    final imovel = await imovelService.getById(despesa.imovelId);
    return imovel.local;
  }
}
