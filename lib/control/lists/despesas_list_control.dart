import 'package:aluguel/models/despesa.dart';
import 'package:aluguel/service/despesa_service.dart';
import 'package:flutter/material.dart';

class DespesasListControl {
  final service = DespesaService();

  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> despesas = await service.getAllFetch();
    despesas.sort((a, b) => -a["despesa"].date.compareTo(b["despesa"].date));
    return despesas;
  }

  Future openReviewScreen(BuildContext context, Despesa despesa) async {
    await Navigator.pushNamed(context, '/review/despesa', arguments: despesa);
  }
}
