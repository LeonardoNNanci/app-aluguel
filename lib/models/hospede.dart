import 'package:aluguel/config/sqflite/config.dart';
import 'package:aluguel/models/abstract_model.dart';

class Hospede extends AbstractModel {
  String nome;
  String email;
  String endereco;
  String cpf;

  Hospede(
    this.nome,
    this.email,
    this.endereco,
    this.cpf, {
    id,
  }) : super(id, HospedeTable, HospedeIdField);

  Hospede.empty() : super.empty(HospedeTable, HospedeIdField);

  Hospede.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.nome = map[HospedeNomeField];
    this.email = map[HospedeEmailField];
    this.endereco = map[HospedeEnderecoField];
    this.cpf = map[HospedeCpfField];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map[HospedeIdField] = this.id;

    map[HospedeNomeField] = this.nome;
    map[HospedeEmailField] = this.email;
    map[HospedeEnderecoField] = this.endereco;
    map[HospedeCpfField] = this.cpf;

    return map;
  }

  @override
  String toString() {
    return "Hóspede: { "
        "Id: $id | "
        "Nome : $nome }";
  }
}
