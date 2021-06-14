import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';

import 'generic_review_control.dart';

class HospedeReviewControl extends ReviewControl {
  Hospede get hospede => item;

  set hospede(Hospede hospede) => item = hospede;

  HospedeReviewControl() : super(HospedeService(), '/edit/hospede');
}
