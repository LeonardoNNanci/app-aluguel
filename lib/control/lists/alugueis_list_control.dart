import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/screens/review/aluguel_review.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:flutter/material.dart';

class AlugueisListControl{
  final service = AluguelService();

  Future<List<Map<String, dynamic>>> getAll() async {
    return await service.getAllFetch();
  }

  openReviewScreen(BuildContext context, Aluguel aluguel){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AluguelReview(aluguel)),
    );
  }
}