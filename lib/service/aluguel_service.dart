import 'package:aluguel/daos/implementations/aluguel_dao.dart';
import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'general_service.dart';

class AluguelService extends Service<Aluguel> {
  final imovelService = ImovelService();
  final hospedeService = HospedeService();

  AluguelService() : super(AluguelDao());

  Future<Map<String, dynamic>> getAluguelByIdFetch(int id) async {
    final Aluguel aluguel = await dao.selectById(id);
    final Imovel imovel = await imovelService.getById(aluguel.imovelId);
    final Hospede hospede = await hospedeService.getById(aluguel.imovelId);
    return {
      "aluguel": aluguel,
      "imovel": imovel,
      "hospede": hospede,
    };
  }

  Future<List<Map<String, dynamic>>> getAllFetch() async {
    final ans = <Map<String, dynamic>>[];
    final alugueis = await dao.selectAll();

    for (Aluguel aluguel in alugueis) {
      final Imovel imovel = await imovelService.getById(aluguel.imovelId);
      final Hospede hospede = await hospedeService.getById(aluguel.imovelId);
      ans.add({
        "aluguel": aluguel,
        "imovel": imovel,
        "hospede": hospede,
      });
    }

    return ans;
  }
}
