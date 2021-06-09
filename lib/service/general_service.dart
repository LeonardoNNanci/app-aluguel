import 'package:aluguel/daos/implementations/generic_dao.dart';
import 'package:aluguel/models/abstract_model.dart';

class Service<T extends AbstractModel>{
  final GenericDao dao;

  Service(this.dao);

  Future<T> create(T item) async {
    assert(item.id == null);
    return await dao.insert(item);
  }

  Future<T> update(T item) async {
    assert(item.id != null);
    if (await dao.selectById(item.id) == null) return null;
    return await dao.update(item);
  }

  Future<T> remove(T item) async {
    if (item.id == null) return null;
    if (await dao.selectById(item.id) == null) return null;
    return await dao.delete(item);
  }

  Future<List<T>> getAll() async {
    return await dao.selectAll();
  }

  Future<T> getById(int id) async {
    return await dao.selectById(id);
  }
}