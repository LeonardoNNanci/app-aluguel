import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';

import 'generic_review_control.dart';

class DespesaReviewControl extends ReviewControl {

  final imovelService = ImovelService();
  final Despesa _despesa;

  DespesaReviewControl(this._despesa)
      : super(DespesaService(), Placeholder(), _despesa);

  Future<String> getImovelName() async {
    final imovel = await imovelService.getById(_despesa.imovelId);
    return imovel.local;
  }
}
