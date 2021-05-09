import 'hospede.dart';
import 'imovel.dart';

class Aluguel {
  Imovel _imovel;
  Hospede _hospede;
  DateTime _checkin, _checkout;
  int _totalHospedes;
  double _valor;
  String _forma;
  String _observacao;
  bool _roupaDeCama;

  Aluguel(
    this._imovel,
    this._hospede,
    this._checkin,
    this._checkout,
    this._totalHospedes,
    this._valor,
    this._forma,
    this._roupaDeCama,
    this._observacao,
  );

  Imovel get imovel {
    return this._imovel;
  }

  Hospede get hospede {
    return this._hospede;
  }

  DateTime get checkin {
    return this._checkin;
  }

  DateTime get checkout {
    return this._checkout;
  }

  int get totalHospedes {
    return this._totalHospedes;
  }

  double get valor {
    return this._valor;
  }

  String get forma {
    return this._forma;
  }

  String get observacao {
    return this._observacao;
  }

  bool get roupaDeCama {
    return this._roupaDeCama;
  }

  set imovel(Imovel imovel) {
    this._imovel = imovel;
  }

  set hospede(Hospede hospede) {
    this._hospede = hospede;
  }

  set checkin(DateTime checkin) {
    this._checkin = checkin;
  }

  set checkout(DateTime checkout) {
    this._checkout = checkout;
  }

  set totalHospedes(int totalHospedes) {
    this._totalHospedes = totalHospedes;
  }

  set valor(double valor) {
    this._valor = valor;
  }

  set forma(String forma) {
    this._forma = forma;
  }

  set observacao(String observacao) {
    this._observacao = observacao;
  }

  set roupaDeCama(bool roupaDeCama) {
    this._roupaDeCama = roupaDeCama;
  }

  @override
  String toString() {
    var localImovel = _imovel.local;
    var hospede = _hospede.nome;
    return "Aluguel: { "
        "Local: $localImovel  |  "
        "Hóspede: $hospede  |  "
        "Checkin: $_checkin  |  "
        "Checkout: $_checkout  |  "
        "Total de hóspedes: $_totalHospedes  |  "
        "Valor: $_valor }";
  }
}