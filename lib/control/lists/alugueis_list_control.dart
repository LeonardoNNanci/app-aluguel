import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:flutter/material.dart';

class AlugueisListControl {
  final service = AluguelService();

  Future<List<Map<String, dynamic>>> getAll() async {
    List<Map<String, dynamic>> alugueis = await service.getAllFetch();
    alugueis.sort((a, b) {
      final aPast = a["aluguel"].checkin.isBefore(DateTime.now());
      final bPast = b["aluguel"].checkin.isBefore(DateTime.now());
      if (aPast && !bPast) return 1;
      if (!aPast && bPast) return -1;
      if (aPast && bPast) {
        int ans = a["aluguel"].checkin.compareTo(b["aluguel"].checkin);
        if (ans != 0) return -ans;
        return -a["aluguel"].checkout.compareTo(b["aluguel"].checkout);
      }
      int ans = a["aluguel"].checkin.compareTo(b["aluguel"].checkin);
      if (ans != 0) return ans;
      return a["aluguel"].checkout.compareTo(b["aluguel"].checkout);
    });
    return alugueis;
  }

  Future openReviewScreen(BuildContext context, Aluguel aluguel) async {
    await Navigator.pushNamed(context, '/review/aluguel', arguments: aluguel);
  }
}
