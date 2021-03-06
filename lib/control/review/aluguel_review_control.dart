import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_review_control.dart';

class AluguelReviewControl extends ReviewControl {
  final imovelService = ImovelService();
  final hospedeService = HospedeService();

  Aluguel get aluguel => item;

  set aluguel(Aluguel aluguel) => item = aluguel;

  AluguelReviewControl() : super(AluguelService(), '/edit/aluguel');

  Future<String> getImovelName() async {
    final imovel = await imovelService.getById(aluguel.imovelId);
    return imovel.local;
  }

  Future<String> getHospedeName() async {
    final hospede = await hospedeService.getById(aluguel.imovelId);
    return hospede.nome;
  }
}
