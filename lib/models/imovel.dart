import 'package:aluguel/models/abstract_model.dart';
import 'package:aluguel/util/parse_maybe.dart';

class Imovel extends AbstractModel {
  String local;
  int maxHospedes;
  double tarifaPadrao;
  double descontoSemana;
  double descontoMes;

  @override
  String table = 'imovel';

  Imovel(
    this.local,
    this.maxHospedes,
    this.tarifaPadrao,
    this.descontoSemana,
    this.descontoMes, {
    id,
  }) : super(id);

  Imovel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.local = map["local"];
    this.maxHospedes =  parseMaybe<int>(map["max_hospedes"]);
    this.tarifaPadrao = parseMaybe<double>(map["tarifa_padrao"]);
    this.descontoSemana = parseMaybe<double>(map["desconto_semana"]);
    this.descontoMes = parseMaybe<double>(map["desconto_mes"]);
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["local"] = this.local;
    map["max_hospedes"] = this.maxHospedes;
    map["tarifa_padrao"] = this.tarifaPadrao;
    map["desconto_semana"] = this.descontoSemana;
    map["desconto_mes"] = this.descontoMes;

    return map;
  }

  @override
  String toString() {
    return "Imóvel: { "
        "Id: $id  |  "
        "Local: $local  |  "
        "Hóspedes: $maxHospedes  |  "
        "Tarifa: $tarifaPadrao }";
  }
}
