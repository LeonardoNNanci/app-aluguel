import 'package:aluguel/daos/implementations/generic_dao.dart';
import 'package:aluguel/models/hospede.dart';

class HospedeDao extends GenericDao<Hospede> {
  HospedeDao() : super((map) => Hospede.fromMap(map), () => Hospede.empty());
}
