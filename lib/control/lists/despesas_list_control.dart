import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:flutter/material.dart';

class DespesasListControl {
  final service = DespesaService();

  Future<List<Map<String, dynamic>>> getAll() async {
    return await service.getAllFetch();
  }

  openReviewScreen(BuildContext context, Despesa despesa) {
    Navigator.pushNamed(context, '/review/despesa', arguments: despesa);
  }
}
