import 'package:aluguel/models/database_model.dart';
import 'package:aluguel/models/imovel.dart';

class Despesa extends DatabaseModel {
  String _servico;
  double _valor;
  Imovel _imovel;

  Despesa(
    this._servico,
    this._valor,
    this._imovel, {
    id,
  }) : super(id);

  Despesa.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._servico = map["servico"];
    this._valor = map["valor"];
    this._imovel = map["imovel_id"];
  }

  String get servico {
    return this._servico;
  }

  double get valor {
    return this._valor;
  }

  Imovel get imovel {
    return this._imovel;
  }

  set servico(String servico) {
    this._servico = servico;
  }

  set valor(double valor) {
    this._valor = valor;
  }

  set imovel(Imovel imovel) {
    this._imovel = imovel;
  }

  @override
  String toString() {
    var imovel = _imovel.local;
    return "Despesa: { "
        "Servico: $_servico  |  "
        "Imóvel: $imovel  |  "
        "Valor: $_valor }";
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["servico"] = this._servico;
    map["valor"] = this._valor;
    map["imovel_id"] = this._imovel;

    return map;
  }
}
