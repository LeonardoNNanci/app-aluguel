import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_review_control.dart';

class DespesaReviewControl extends ReviewControl {
  final imovelService = ImovelService();

  Despesa get despesa => item;

  set despesa(Despesa despesa) => item = despesa;

  DespesaReviewControl() : super(DespesaService(), '/edit/despesa');

  Future<String> getImovelName() async {
    final imovel = await imovelService.getById(despesa.imovelId);
    return imovel.local;
  }
}
