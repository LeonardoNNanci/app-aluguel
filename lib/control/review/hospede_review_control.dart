import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/screens/forms/hospede_form.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:flutter/cupertino.dart';

import 'generic_review_control.dart';

class HospedeReviewControl extends ReviewControl {
  final Hospede hospede;

  HospedeReviewControl(this.hospede)
      : super(HospedeService(), HospedeForm(hospede: hospede), hospede);
}
