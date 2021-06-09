import 'package:aluguel/models/imovel.dart';
import 'package:aluguel/screens/review/imovel_review.dart';
import 'package:aluguel/service/imovel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImoveisListControl{
  final service = ImovelService();

  Future<List<Imovel>> getAll() async {
    return await service.getAll();
  }

  openReviewScreen(BuildContext context, Imovel imovel){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ImovelReview(imovel)),
    );
  }
}