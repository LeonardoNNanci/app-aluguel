import 'package:aluguel/daos/aluguel_dao.dart';
import 'package:aluguel/models/aluguel.dart';

class HospedeService {
  AluguelDao hospedeDao = AluguelDao();

  Future<Aluguel> create(Aluguel aluguel) async {
    if (aluguel.id != null) return null;
    return await hospedeDao.insert(aluguel);
  }

  Future<Aluguel> update(Aluguel aluguel) async {
    if (aluguel.id == null) return null;
    if (await hospedeDao.selectById(aluguel.id) == null) return null;
    return await hospedeDao.update(aluguel);
  }

  Future<Aluguel> remove(Aluguel aluguel) async {
    if (aluguel.id == null) return null;
    if (await hospedeDao.selectById(aluguel.id) == null) return null;
    return await hospedeDao.delete(aluguel);
  }

  Future<List<Aluguel>> getAll() async {
    return await hospedeDao.selectAll();
  }
}
