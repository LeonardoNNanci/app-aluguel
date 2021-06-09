import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';

import 'generic_review_control.dart';

class ImovelReviewControl extends ReviewControl {
  final Imovel imovel;

  ImovelReviewControl(this.imovel)
      : super(ImovelService(), Placeholder(), imovel);
}
