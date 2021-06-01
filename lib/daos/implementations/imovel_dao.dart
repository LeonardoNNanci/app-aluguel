import 'package:aluguel/daos/implementations/generic_dao.dart';
import 'package:aluguel/models/imovel.dart';

class ImovelDao extends GenericDao<Imovel> {
  ImovelDao() : super((map) => Imovel.fromMap(map), () => Imovel.empty());
}
