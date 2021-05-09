import 'package:aluguel/util/validations.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final String prefix;
  final String suffix;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final TextEditingController controller;
  final List<Function> validations;

  const InputField({
    Key key,
    this.label,
    this.hint,
    this.icon,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.capitalization,
    this.controller,
    this.validations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          icon: icon != null ? Icon(icon) : null,
          prefixText: prefix,
          suffixText: suffix,
        ),
        keyboardType: keyboardType,
        textCapitalization: capitalization != null
            ? capitalization
            : TextCapitalization.sentences,
        controller: controller,
        validator: _validator,
      ),
    );
  }

  String _validator(String value) {
    if (validations == null) return null;

    var required = validations.firstWhere(
        (element) => element == Validations.nonEmpty,
        orElse: () => null);
    // Se for não required e estiver vazio, não testa as outras
    if (required == null && Validations.nonEmpty(value) != null) return null;

    String msg;
    for (Function validation in validations) {
      msg = validation(value);
      if (msg != null) return msg;
    }

    return null;
  }
}