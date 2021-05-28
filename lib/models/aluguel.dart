import 'package:aluguel/models/abstract_model.dart';

class Aluguel extends AbstractModel {
  int imovelId;
  int hospedeId;
  DateTime checkin, checkout;
  int totalHospedes;
  double valor;
  String forma;
  String observacao;
  bool roupaDeCama;

  Aluguel(
      this.imovelId,
      this.hospedeId,
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
    this.imovelId = map["imovel_id"];
    this.hospedeId = map["hospede_id"];
    this.checkin = map["checkin"];
    this.checkout = map["checkout"];
    this.totalHospedes = map["total_hospedes"];
    this.valor = map["valor"];
    this.forma = map["forma"];
    this.roupaDeCama = map["roupa_de_cama"];
    this.observacao = map["observacao"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["imovel_id"] = this.imovelId;
    map["hospede_id"] = this.hospedeId;
    map["checkin"] = this.checkin.toString();
    map["checkout"] = this.checkout.toString();
    map["total_hospedes"] = this.totalHospedes;
    map["valor"] = this.valor;
    map["forma"] = this.forma;
    map["roupa_de_cama"] = this.roupaDeCama.toString();
    map["observacao"] = this.observacao;

    return map;
  }

  @override
  String toString() {
    return "Aluguel: { "
        "Id: $id  |  "
        "Local: $imovelId  |  "
        "Hóspede: $hospedeId  |  "
        "Checkin: $checkin  |  "
        "Checkout: $checkout  |  "
        "Total de hóspedes: $totalHospedes  |  "
        "Valor: $valor }";
  }
}
