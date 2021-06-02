import 'package:aluguel/daos/implementations/imovel_dao.dart';
import 'package:aluguel/models/imovel.dart';

import 'general_service.dart';

class ImovelService extends Service<Imovel> {
  ImovelService() : super(ImovelDao());
}
