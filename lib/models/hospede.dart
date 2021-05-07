class Hospede {

  String _nome;
  String _email;
  String _endereco;
  String _cpf;

  String get nome{
    return this._nome;
  }

  String get email{
    return this._email;
  }

  String get endereco{
    return this._endereco;
  }

  String get cpf{
    return this._cpf;
  }

  set nome(String nome){
    this._nome = nome;
  }

  set email(String email){
    this._email = email;
  }

  set endereco(String endereco){
    this._endereco = endereco;
  }

  set cpf(String cpf){
    this._cpf = cpf;
  }
  
}