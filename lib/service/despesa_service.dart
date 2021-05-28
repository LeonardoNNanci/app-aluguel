import 'package:aluguel/daos/despesa_dao.dart';
import 'package:aluguel/models/despesa.dart';

class HospedeService {
  DespesaDao _despesaDao = DespesaDao();

  Future<Despesa> create(Despesa despesa) async {
    if (despesa.id != null) return null;
    return await _despesaDao.insert(despesa);
  }

  Future<Despesa> update(Despesa despesa) async {
    if (despesa.id == null) return null;
    if (await _despesaDao.selectById(despesa.id) == null) return null;
    return await _despesaDao.update(despesa);
  }

  Future<Despesa> remove(Despesa despesa) async {
    if (despesa.id == null) return null;
    if (await _despesaDao.selectById(despesa.id) == null) return null;
    return await _despesaDao.delete(despesa);
  }

  Future<List<Despesa>> getAll() async {
    return await _despesaDao.selectAll();
  }
}
