import 'package:aluguel/service/aluguel_service.dart';

class HomeControl {
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

    return ans;
  }
}
