import 'package:aluguel/daos/implementations/hospede_dao.dart';
import 'package:aluguel/models/hospede.dart';

import 'general_service.dart';

class HospedeService extends Service<Hospede> {
  HospedeService() : super(HospedeDao());
}
