import 'package:aluguel/daos/implementations/aluguel_dao.dart';
import 'package:aluguel/models/aluguel.dart';

class AluguelService {
  AluguelDao _hospedeDao = AluguelDao();

  Future<Aluguel> create(Aluguel aluguel) async {
    if (aluguel.id != null) return null;
    return await _hospedeDao.insert(aluguel);
  }

  Future<Aluguel> update(Aluguel aluguel) async {
    if (aluguel.id == null) return null;
    if (await _hospedeDao.selectById(aluguel.id) == null) return null;
    return await _hospedeDao.update(aluguel);
  }

  Future<Aluguel> remove(Aluguel aluguel) async {
    if (aluguel.id == null) return null;
    if (await _hospedeDao.selectById(aluguel.id) == null) return null;
    return await _hospedeDao.delete(aluguel);
  }

  Future<List<Aluguel>> getAll() async {
    return await _hospedeDao.selectAll();
  }
}
