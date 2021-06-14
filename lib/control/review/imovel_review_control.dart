import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';

import 'generic_review_control.dart';

class ImovelReviewControl extends ReviewControl {
  Imovel get imovel => item;

  set imovel(Imovel imovel) => item = imovel;

  ImovelReviewControl() : super(ImovelService(), '/edit/imovel');
}
