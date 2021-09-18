import 'package:aluguel/models/hospede.dart';
import 'package:aluguel/service/hospede_service.dart';
import 'package:flutter/material.dart';

class HospedesListControl {
  final service = HospedeService();

  Future<List<Hospede>> getAll() async {
    List<Hospede> hospedes = await service.getAll();
    hospedes.sort((a, b) => a.nome.compareTo(b.nome));
    return hospedes;
  }

  Future openReviewScreen(BuildContext context, Hospede hospede) async {
    await Navigator.pushNamed(context, '/review/hospede', arguments: hospede);
  }
}
