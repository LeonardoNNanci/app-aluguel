import 'dart:ffi';

import 'package:aluguel/models/imovel.dart';

class Despesa{

  String _servico;
  Float _valor;
  Imovel _imovel;

  String get servico{
    return this._servico;
  }

  Float get valor{
    return this._valor;
  }

  Imovel get imovel{
    return this._imovel;
  }

  set servico(String servico){
    this._servico = servico;
  }

  set valor(Float valor){
    this._valor = valor;
  }

  set imovel(Imovel imovel){
    this._imovel = imovel;
  }

}