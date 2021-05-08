class Imovel {
  String _local;
  int _maxHospedes;
  double _tarifaPadrao;
  double _descontoSemana;
  double _descontoMes;

  String get local {
    return this._local;
  }

  int get maxHospedes{
    return this._maxHospedes;
  }

  double get tarifaPadrao{
    return this._tarifaPadrao;
  }

  double get descontoSemana{
    return this._descontoSemana;
  }

  double get descontoMes{
    return this._descontoMes;
  }

  set local(String local){
    this._local = local;
  }

  set maxHospedes(int maxHospedes){
    this._maxHospedes = maxHospedes;
  }

  set tarifaPadrao(double tarifaPadrao){
    this._tarifaPadrao = tarifaPadrao;
  }

  set descontoSemana(double descontoSemana){
    this._descontoSemana = descontoSemana;
  }

  set descontoMes(double descontoMes){
    this._descontoMes = descontoMes;
  }
}
