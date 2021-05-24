import 'package:aluguel/models/abstract_model.dart';

import 'hospede.dart';
import 'imovel.dart';

class Aluguel extends AbstractModel {
  Imovel imovel;
  Hospede hospede;
  DateTime checkin, checkout;
  int totalHospedes;
  double valor;
  String forma;
  String observacao;
  bool roupaDeCama;

  Aluguel(
      this.imovel,
      this.hospede,
      this.checkin,
      this.checkout,
      this.totalHospedes,
      this.valor,
      this.forma,
      this.roupaDeCama,
      this.observacao,
      {id})
      : super(id);

  Aluguel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.imovel = map["imovel"];
    this.hospede = map["hospede"];
    this.checkin = map["checkin"];
    this.checkout = map["checkout"];
    this.totalHospedes = map["totalHospedes"];
    this.valor = map["valor"];
    this.forma = map["forma"];
    this.roupaDeCama = map["roupaDeCama"];
    this.observacao = map["observacao"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["imovel"] = this.imovel;
    map["hospede"] = this.hospede;
    map["checkin"] = this.checkin;
    map["checkout"] = this.checkout;
    map["totalHospedes"] = this.totalHospedes;
    map["valor"] = this.valor;
    map["forma"] = this.forma;
    map["roupaDeCama"] = this.roupaDeCama;
    map["observacao"] = this.observacao;

    return map;
  }

  @override
  String toString() {
    final localImovel = imovel.local;
    final nomeHospede = hospede.nome;
    return "Aluguel: { "
        "Id: $id  |  "
        "Local: $localImovel  |  "
        "Hóspede: $nomeHospede  |  "
        "Checkin: $checkin  |  "
        "Checkout: $checkout  |  "
        "Total de hóspedes: $totalHospedes  |  "
        "Valor: $valor }";
  }
}
