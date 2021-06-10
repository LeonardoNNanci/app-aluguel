import 'package:aluguel/config/sqflite/config.dart';
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
      : super(id, AluguelTable, AluguelIdField);

  Aluguel.empty() : super.empty(AluguelTable, AluguelIdField);

  Aluguel.fromMap(Map<String, dynamic> map)
      : super.fromMap(map, AluguelTable, AluguelIdField) {
    this.imovelId = map[AluguelImovelField];
    this.hospedeId = map[AluguelHospedeField];
    this.checkin = DateTime.parse(map[AluguelCheckinField]);
    this.checkout = DateTime.parse(map[AluguelCheckoutField]);
    this.totalHospedes = map[AluguelTotalHospedesField];
    this.valor = map[AluguelValorField];
    this.forma = map[AluguelFormaField];
    this.observacao = map[AluguelObservacaoField];
    if (map[AluguelRoupaDeCamaField] is bool) {
      this.roupaDeCama = map[AluguelRoupaDeCamaField];
    } else {
      this.roupaDeCama = map[AluguelRoupaDeCamaField].toString() == "true";
    }
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map[AluguelIdField] = this.id;

    map[AluguelImovelField] = this.imovelId;
    map[AluguelHospedeField] = this.hospedeId;
    map[AluguelCheckinField] = this.checkin.toString();
    map[AluguelCheckoutField] = this.checkout.toString();
    map[AluguelTotalHospedesField] = this.totalHospedes;
    map[AluguelValorField] = this.valor;
    map[AluguelFormaField] = this.forma;
    map[AluguelRoupaDeCamaField] = this.roupaDeCama.toString();
    map[AluguelObservacaoField] = this.observacao;
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
