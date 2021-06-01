import 'package:aluguel/daos/implementations/generic_dao.dart';
import 'package:aluguel/models/despesa.dart';

class DespesaDao extends GenericDao<Despesa>{
  DespesaDao() : super((map) => Despesa.fromMap(map), () => Despesa.empty());
}
