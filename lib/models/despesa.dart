import 'package:aluguel/models/imovel.dart';

class Despesa {
  String _servico;
  double _valor;
  Imovel _imovel;

  String get servico {
    return this._servico;
  }

  double get valor {
    return this._valor;
  }

  Imovel get imovel {
    return this._imovel;
  }

  set servico(String servico) {
    this._servico = servico;
  }

  set valor(double valor) {
    this._valor = valor;
  }

  set imovel(Imovel imovel) {
    this._imovel = imovel;
  }
}
