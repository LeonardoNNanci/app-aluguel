import 'package:aluguel/daos/implementations/generic_dao.dart';
import 'package:aluguel/models/aluguel.dart';

class AluguelDao extends GenericDao<Aluguel>{
  AluguelDao() : super((map) => Aluguel.fromMap(map), () => Aluguel.empty());
}
