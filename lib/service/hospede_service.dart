import 'package:aluguel/daos/hospede_dao.dart';
import 'package:aluguel/models/hospede.dart';

class HospedeService{
  HospedeDao hospedeDao = HospedeDao();

  Future<Hospede> create(Hospede hospede) async {
    if (hospede.id != null) return null;
    return await hospedeDao.insert(hospede);
  }

  Future<Hospede> update(Hospede hospede) async {
    if (hospede.id == null) return null;
    if (await hospedeDao.selectById(hospede.id) == null) return null;
    return await hospedeDao.update(hospede);
  }

  Future<Hospede> remove(Hospede hospede) async {
    if (hospede.id == null) return null;
    if (await hospedeDao.selectById(hospede.id) == null) return null;
    return await hospedeDao.delete(hospede);
  }

  Future<List<Hospede>> getAll() async {
    return await hospedeDao.selectAll();
  }
}