import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/screens/review/hospede_review.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HospedesListControl{
  final service = HospedeService();

  Future<List<Hospede>> getAll() async {
    return await service.getAll();
  }

  openReviewScreen(BuildContext context, Hospede hospede){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HospedeReview(hospede)),
    );
  }
}