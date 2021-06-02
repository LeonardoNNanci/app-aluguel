import 'package:aluguel/daos/implementations/generic_dao.dart';
import 'package:aluguel/models/abstract_model.dart';

class Service<T extends AbstractModel>{
  final GenericDao _dao;

  Service(this._dao);

  Future<T> create(T item) async {
    assert(item.id == null);
    return await _dao.insert(item);
  }

  Future<T> update(T item) async {
    assert(item.id != null);
    if (await _dao.selectById(item.id) == null) return null;
    return await _dao.update(item);
  }

  Future<T> remove(T item) async {
    if (item.id == null) return null;
    if (await _dao.selectById(item.id) == null) return null;
    return await _dao.delete(item);
  }

  Future<List<T>> getAll() async {
    return await _dao.selectAll();
  }
}