import 'package:aluguel/models/abstract_model.dart';
import 'package:aluguel/models/imovel.dart';

class Despesa extends AbstractModel {
  String servico;
  double valor;
  Imovel imovel;

  Despesa(
    this.servico,
    this.valor,
    this.imovel, {
    id,
  }) : super(id);

  Despesa.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.servico = map["servico"];
    this.valor = map["valor"];
    this.imovel = map["imovel_id"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["servico"] = this.servico;
    map["valor"] = this.valor;
    map["imovel_id"] = this.imovel;

    return map;
  }

  @override
  String toString() {
    var localImovel = imovel.local;
    return "Despesa: { "
        "Id: $id  |  "
        "Servico: $servico  |  "
        "Imóvel: $localImovel  |  "
        "Valor: $valor }";
  }
}
