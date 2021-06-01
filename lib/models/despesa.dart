import 'package:aluguel/config/sqflite/config.dart';
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
  }) : super(id, DespesaTable, DespesaIdField);

  Despesa.empty() : super.empty(DespesaTable, DespesaIdField);

  Despesa.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.servico = map[DespesaServicoField];
    this.valor = map[DespesaValorField];
    this.date = DateTime.parse(map[DespesaDateField]);
    this.imovelId = map[DespesaImovelField];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map[DespesaIdField] = this.id;

    map[DespesaServicoField] = this.servico;
    map[DespesaValorField] = this.valor;
    map[DespesaDateField] = this.date.toString();
    map[DespesaImovelField] = this.imovelId;

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

  @override
  Despesa instantiateFromMap(Map<String, dynamic> map) {
    return Despesa.fromMap(map);
  }
}
