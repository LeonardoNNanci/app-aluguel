import 'package:aluguel/daos/implementations/imovel_dao.dart';
import 'package:aluguel/models/imovel.dart';

class ImovelService {
  ImovelDao _imovelDao = ImovelDao();

  Future<Imovel> create(Imovel imovel) async {
    if (imovel.id != null) return null;
    return await _imovelDao.insert(imovel);
  }

  Future<Imovel> update(Imovel imovel) async {
    if (imovel.id == null) return null;
    if (await _imovelDao.selectById(imovel.id) == null) return null;
    return await _imovelDao.update(imovel);
  }

  Future<Imovel> remove(Imovel imovel) async {
    if (imovel.id == null) return null;
    if (await _imovelDao.selectById(imovel.id) == null) return null;
    return await _imovelDao.delete(imovel);
  }

  Future<List<Imovel>> getAll() async {
    return await _imovelDao.selectAll();
  }
}
