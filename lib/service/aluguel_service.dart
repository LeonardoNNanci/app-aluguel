import 'package:aluguel/daos/implementations/aluguel_dao.dart';
import 'package:aluguel/models/aluguel.dart';

import 'general_service.dart';

class AluguelService extends Service<Aluguel> {
  AluguelService() : super(AluguelDao());
}
