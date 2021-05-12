import 'package:aluguel/models/database_model.dart';

class Imovel extends DatabaseModel {
  String _local;
  int _maxHospedes;
  double _tarifaPadrao;
  double _descontoSemana;
  double _descontoMes;

  Imovel(
    this._local,
    this._maxHospedes,
    this._tarifaPadrao,
    this._descontoSemana,
    this._descontoMes, {
    id,
  }) : super(id);

  Imovel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._local = map["local"];
    this._maxHospedes = map["max_hospedes"];
    this._tarifaPadrao = map["tarifa_padrao"];
    this._descontoSemana = map["desconto_semana"];
    this._descontoMes = map["descontoM_mes"];
  }

  String get local {
    return this._local;
  }

  int get maxHospedes {
    return this._maxHospedes;
  }

  double get tarifaPadrao {
    return this._tarifaPadrao;
  }

  double get descontoSemana {
    return this._descontoSemana;
  }

  double get descontoMes {
    return this._descontoMes;
  }

  set local(String local) {
    this._local = local;
  }

  set maxHospedes(int maxHospedes) {
    this._maxHospedes = maxHospedes;
  }

  set tarifaPadrao(double tarifaPadrao) {
    this._tarifaPadrao = tarifaPadrao;
  }

  set descontoSemana(double descontoSemana) {
    this._descontoSemana = descontoSemana;
  }

  set descontoMes(double descontoMes) {
    this._descontoMes = descontoMes;
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["local"] = this._local;
    map["max_hospedes"] = this._maxHospedes;
    map["tarifa_padrao"] = this._tarifaPadrao;
    map["desconto_semana"] = this._descontoSemana;
    map["desconto_mes"] = this._descontoMes;

    return map;
  }

  @override
  String toString() {
    return "Imóvel: { "
        "Local: $_local  |  "
        "Hóspedes: $_maxHospedes  |  "
        "Tarifa: $_tarifaPadrao }";
  }
}
