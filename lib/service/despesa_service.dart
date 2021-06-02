import 'package:aluguel/daos/implementations/despesa_dao.dart';
import 'package:aluguel/models/despesa.dart';

import 'general_service.dart';

class DespesaService extends Service<Despesa> {
  DespesaService() : super(DespesaDao());
}
