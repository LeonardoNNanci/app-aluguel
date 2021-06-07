import 'package:aluguel/config/sqflite/config.dart';
import 'package:aluguel/models/abstract_model.dart';

class Imovel extends AbstractModel {
  String local;
  int maxHospedes;
  double tarifaPadrao;
  double descontoSemana;
  double descontoMes;

  Imovel(
    this.local,
    this.maxHospedes,
    this.tarifaPadrao,
    this.descontoSemana,
    this.descontoMes, {
    id,
  }) : super(id, ImovelTable, ImovelIdField);

  Imovel.empty() : super.empty(ImovelTable, ImovelIdField);

  Imovel.fromMap(Map<String, dynamic> map)
      : super.fromMap(map, ImovelTable, ImovelIdField) {
    this.local = map[ImovelLocalField];
    this.maxHospedes = map[ImovelMaxHospedesField];
    this.tarifaPadrao = map[ImovelTarifaField];
    this.descontoSemana = map[ImovelDescontoSemanaField];
    this.descontoMes = map[ImovelDescontoMesField];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map[ImovelIdField] = this.id;

    map[ImovelLocalField] = this.local;
    map[ImovelMaxHospedesField] = this.maxHospedes;
    map[ImovelTarifaField] = this.tarifaPadrao;
    map[ImovelDescontoSemanaField] = this.descontoSemana;
    map[ImovelDescontoMesField] = this.descontoMes;

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
