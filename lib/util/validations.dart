String nonEmptyValidation(String value) {
  if (value == null || value.isEmpty) {
    return "Este campo é obrigatório.";
  }
  return null;
}

String nonNegativeIntValidation(String value) {
  var emptyValidationMsg = nonEmptyValidation(value);
  if (emptyValidationMsg != null) return emptyValidationMsg;

  int val = int.tryParse(value);
  if(val == null) return "Campo numérico inteiro.";
  if(val < 0)     return "Campo não negativo.";
  return null;
}

String nonNegativeDoubleValidation(String value) {
  var emptyValidationMsg = nonEmptyValidation(value);
  if (emptyValidationMsg != null) return emptyValidationMsg;

  double val = double.tryParse(value);
  if(val == null) return "Campo numérico.";
  if(val < 0)     return "Campo não negativo.";
  return null;
}

String percentValidation(String value) {
  var emptyValidationMsg = nonEmptyValidation(value);
  if (emptyValidationMsg != null) return emptyValidationMsg;

  var negDoubleMsg = nonNegativeDoubleValidation(value);
  if(negDoubleMsg != null)  return negDoubleMsg;

  var val = double.parse(value);
  if(val < 0 || val > 100)  return "Valor inválido.";
  return null;
}
