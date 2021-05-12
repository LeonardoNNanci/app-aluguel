import 'package:aluguel/models/database_model.dart';

class Hospede extends DatabaseModel {
  String _nome;
  String _email;
  String _endereco;
  String _cpf;

  Hospede(
    this._nome,
    this._email,
    this._endereco,
    this._cpf, {
    id,
  }) : super(id);

  Hospede.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._nome = map["nome"];
    this._email = map["email"];
    this._endereco = map["endereco"];
    this._cpf = map["cpf"];
  }

  String get nome {
    return this._nome;
  }

  String get email {
    return this._email;
  }

  String get endereco {
    return this._endereco;
  }

  String get cpf {
    return this._cpf;
  }

  set nome(String nome) {
    this._nome = nome;
  }

  set email(String email) {
    this._email = email;
  }

  set endereco(String endereco) {
    this._endereco = endereco;
  }

  set cpf(String cpf) {
    this._cpf = cpf;
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = Map();

    if (this.id != null) map["id"] = this.id;

    map["nome"] = this._nome;
    map["email"] = this._email;
    map["endereco"] = this._endereco;
    map["cpf"] = this._cpf;

    return map;
  }

  @override
  String toString() {
    return "Hóspede: { "
        "Nome : $_nome }";
  }
}
