import 'package:aluguel/models/aluguel.dart';
import 'package:aluguel/service/aluguel_service.dart';
import 'package:flutter/material.dart';

class OverviewControl {
  final AluguelService _aluguelService = AluguelService();

  Future<List<Map<String, dynamic>>> getFutureAlugueis() async {
    final now = DateTime.now();
    final ans = <Map<String, dynamic>>[];
    final alugueis = await _aluguelService.getAllFetch();

    for (final aluguel in alugueis) {
      if (aluguel["aluguel"].checkin.isAfter(now)) {
        ans.add(aluguel);
      }
    }

    _sort(ans, false);

    return ans;
  }

  Future<List<Map<String, dynamic>>> getOnGoingAlugueis() async {
    final now = DateTime.now();
    final ans = <Map<String, dynamic>>[];
    final alugueis = await _aluguelService.getAllFetch();

    print(alugueis);

    for (final aluguel in alugueis) {
      final _aluguel = aluguel["aluguel"];
      if (_aluguel.checkin.isBefore(now) && _aluguel.checkout.isAfter(now)) {
        ans.add(aluguel);
      }
    }

    _sort(ans, true);

    return ans;
  }

  Future openAluguelScreen(BuildContext context, String route, Aluguel aluguel) async {
    await Navigator.pushNamed(context, route, arguments: aluguel);
  }

  List<Map<String, dynamic>> _sort(List<Map<String, dynamic>> l, bool reverse) {
    int order = reverse ? -1 : 1;
    l.sort((a, b) {
      int aux = a["aluguel"].checkin.compareTo(b["aluguel"].checkin);
      if (aux != 0) return aux * order;
      return a["aluguel"].checkout.compareTo(b["aluguel"].checkout) * -order;
    });
    return l;
  }
}
