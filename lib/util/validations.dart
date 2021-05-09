class Validations {
  Validations._();

  static Function(String value) nonEmpty = (String value) {
    if (value == null || value.isEmpty) {
      return "Campo obrigatório.";
    }
    return null;
  };

  static Function(String value) nonNegativeInt = (String value) {
    int val = int.tryParse(value);
    if (val == null) return "Campo numérico inteiro.";
    if (val < 0) return "Campo não negativo.";
    return null;
  };

  static Function(String value) nonNegativeDouble = (String value) {
    double val = double.tryParse(value);
    if (val == null) return "Campo numérico.";
    if (val < 0) return "Campo não negativo.";
    return null;
  };

  static Function(String value) percent0To100 = (String value) {
    var negDoubleMsg = nonNegativeDouble(value);
    if (negDoubleMsg != null) return negDoubleMsg;

    var val = double.parse(value);
    if (val < 0 || val > 100) return "Valor inválido.";
    return null;
  };
}
