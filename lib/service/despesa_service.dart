import 'package:aluguel/daos/implementations/despesa_dao.dart';
import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'general_service.dart';

class DespesaService extends Service<Despesa> {
  final imovelService = ImovelService();

  DespesaService() : super(DespesaDao());

  Future<Map<String, dynamic>> getDespesaByIdFetch(int id) async {
    final Despesa despesa = await dao.selectById(id);
    final Imovel imovel = await imovelService.getById(despesa.imovelId);
    return {"despesa": despesa, "imovel": imovel};
  }

  Future<List<Map<String, dynamic>>> getAllFetch() async {
    final ans = <Map<String, dynamic>>[];
    final despesas = await dao.selectAll();

    for (Despesa despesa in despesas) {
      final Imovel imovel = await imovelService.getById(despesa.imovelId);
      ans.add({
        "despesa": despesa,
        "imovel": imovel,
      });
    }

    return ans;
  }
}
