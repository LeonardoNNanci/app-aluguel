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
  }) : super(id);

  Hospede.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this.nome = map["nome"];
    this.email = map["email"];
    this.endereco = map["endereco"];
    this.cpf = map["cpf"];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["nome"] = this.nome;
    map["email"] = this.email;
    map["endereco"] = this.endereco;
    map["cpf"] = this.cpf;

    return map;
  }

  @override
  String toString() {
    return "Hóspede: { "
        "Id: $id | "
        "Nome : $nome }";
  }
}
