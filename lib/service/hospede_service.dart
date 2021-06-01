import 'package:aluguel/daos/implementations/hospede_dao.dart';
import 'package:aluguel/models/hospede.dart';

class HospedeService{
  HospedeDao _hospedeDao = HospedeDao();

  Future<Hospede> create(Hospede hospede) async {
    assert(hospede.id == null);
    return await _hospedeDao.insert(hospede);
  }

  Future<Hospede> update(Hospede hospede) async {
    assert(hospede.id != null);
    assert(await _hospedeDao.selectById(hospede.id) != null);
    return await _hospedeDao.update(hospede);
  }

  Future<Hospede> remove(Hospede hospede) async {
    assert(hospede.id != null);
    assert(await _hospedeDao.selectById(hospede.id) != null);
    return await _hospedeDao.delete(hospede);
  }

  Future<List<Hospede>> getAll() async {
    return await _hospedeDao.selectAll();
  }
}