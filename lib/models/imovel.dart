import 'dart:ffi';

class Imovel {
  String _local;
  int _maxHospedes;
  Float _tarifaPadrao;
  Float _descontoSemana;
  Float _descontoMes;

  String get local {
    return this._local;
  }

  int get maxHospedes{
    return this._maxHospedes;
  }

  Float get tarifaPadrao{
    return this._tarifaPadrao;
  }

  Float get descontoSemana{
    return this._descontoSemana;
  }

  Float get descontoMes{
    return this._descontoMes;
  }

  set local(String local){
    this._local = local;
  }

  set maxHospedes(int maxHospedes){
    this._maxHospedes = maxHospedes;
  }

  set tarifaPadrao(Float tarifaPadrao){
    this._tarifaPadrao = tarifaPadrao;
  }

  set descontoSemana(Float descontoSemana){
    this._descontoSemana = descontoSemana;
  }

  set descontoMes(Float descontoMes){
    this._descontoMes = descontoMes;
  }
}
