import 'package:aluguel/models/abstract_model.dart';

class Despesa extends AbstractModel {
  String servico;
  double valor;
  DateTime date;
  int imovelId;

  Despesa(
    this.servico,
    this.valor,
    this.imovelId,
    this.date, {
    id,
  }) : super(id);

  Despesa.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.servico = map["servico"];
    this.valor = map["valor"];
    this.date = DateTime.parse(map["date"]);
    this.imovelId = map["imovel_id"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["servico"] = this.servico;
    map["valor"] = this.valor;
    map["date"] = this.date.toString();
    map["imovel_id"] = this.imovelId;

    return map;
  }

  @override
  String toString() {
    return "Despesa: { "
        "Id: $id  |  "
        "Servico: $servico  |  "
        "Imóvel: $imovelId  |  "
        "Data: $date  |  "
        "Valor: $valor }";
  }
}
