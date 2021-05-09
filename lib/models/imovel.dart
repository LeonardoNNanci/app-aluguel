class Imovel {
  String _local;
  int _maxHospedes;
  double _tarifaPadrao;
  double _descontoSemana;
  double _descontoMes;

  Imovel(
    this._local,
    this._maxHospedes,
    this._tarifaPadrao,
    this._descontoSemana,
    this._descontoMes,
  );

  String get local {
    return this._local;
  }

  int get maxHospedes {
    return this._maxHospedes;
  }

  double get tarifaPadrao {
    return this._tarifaPadrao;
  }

  double get descontoSemana {
    return this._descontoSemana;
  }

  double get descontoMes {
    return this._descontoMes;
  }

  set local(String local) {
    this._local = local;
  }

  set maxHospedes(int maxHospedes) {
    this._maxHospedes = maxHospedes;
  }

  set tarifaPadrao(double tarifaPadrao) {
    this._tarifaPadrao = tarifaPadrao;
  }

  set descontoSemana(double descontoSemana) {
    this._descontoSemana = descontoSemana;
  }

  set descontoMes(double descontoMes) {
    this._descontoMes = descontoMes;
  }

  @override
  String toString() {
    return "Imóvel: { "
        "Local: $_local  |  "
        "Hóspedes: $_maxHospedes  |  "
        "Tarifa: $_tarifaPadrao }";
  }
}
