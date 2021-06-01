import 'package:aluguel/daos/implementations/aluguel_dao.dart';
import 'package:aluguel/models/aluguel.dart';

class AluguelService {
  AluguelDao _aluguelDao = AluguelDao();

  Future<Aluguel> create(Aluguel aluguel) async {
    assert(aluguel.id == null);
    return await _aluguelDao.insert(aluguel);
  }

  Future<Aluguel> update(Aluguel aluguel) async {
    assert(aluguel.id != null);
    if (await _aluguelDao.selectById(aluguel.id) == null) return null;
    return await _aluguelDao.update(aluguel);
  }

  Future<Aluguel> remove(Aluguel aluguel) async {
    if (aluguel.id == null) return null;
    if (await _aluguelDao.selectById(aluguel.id) == null) return null;
    return await _aluguelDao.delete(aluguel);
  }

  Future<List<Aluguel>> getAll() async {
    return await _aluguelDao.selectAll();
  }
}
