import 'package:aluguel/models/abstract_model.dart';
import 'package:aluguel/util/parse_maybe.dart';

class Despesa extends AbstractModel {
  String servico;
  double valor;
  int imovelId;

  Despesa(
    this.servico,
    this.valor,
    this.imovelId, {
    id,
  }) : super(id);

  Despesa.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.servico = map["servico"];
    this.valor = parseMaybe<double>(map["valor"]);
    this.imovelId = parseMaybe<int>(map["imovel_id"]);
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["servico"] = this.servico;
    map["valor"] = this.valor;
    map["imovel_id"] = this.imovelId;

    return map;
  }

  @override
  String toString() {
    return "Despesa: { "
        "Id: $id  |  "
        "Servico: $servico  |  "
        "Imóvel: $imovelId  |  "
        "Valor: $valor }";
  }
}
