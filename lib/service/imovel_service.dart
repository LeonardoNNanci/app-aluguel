import 'package:aluguel/daos/imovel_dao.dart';
import 'package:aluguel/models/imovel.dart';

class ImovelService {
  ImovelDao imovelDao = ImovelDao();

  Future<Imovel> create(Imovel imovel) async {
    if (imovel.id != null) return null;
    return await imovelDao.insert(imovel);
  }

  Future<Imovel> update(Imovel imovel) async {
    if (imovel.id == null) return null;
    if (await imovelDao.selectById(imovel.id) == null) return null;
    return await imovelDao.update(imovel);
  }

  Future<Imovel> remove(Imovel imovel) async {
    if (imovel.id == null) return null;
    if (await imovelDao.selectById(imovel.id) == null) return null;
    return await imovelDao.delete(imovel);
  }

  Future<List<Imovel>> getAll() async {
    return await imovelDao.selectAll();
  }
}
