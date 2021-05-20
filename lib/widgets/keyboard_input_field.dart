import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class KeyboardInputField extends StatelessWidget {
  final String name;
  final String label;
  final String hint;
  final IconData icon;
  final String prefix;
  final String suffix;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final List<String Function(String)> validations;

  const KeyboardInputField(
    this.name, {
    Key key,
    this.label,
    this.hint,
    this.icon,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.capitalization,
    this.validations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderTextField(
        name: name,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          icon: icon != null ? Icon(icon) : null,
          prefixText: prefix,
          suffixText: suffix,
        ),
        validator: validations != null
            ? FormBuilderValidators.compose(validations)
            : null,
        keyboardType: keyboardType,
        textCapitalization: capitalization != null
            ? capitalization
            : TextCapitalization.sentences,
      ),
    );
  }

// String _validator(String value) {
//   if (validations == null) return null;
//
//   var required = validations.firstWhere(
//       (element) => element == Validations.nonEmpty,
//       orElse: () => null);
//   // Se for não required e estiver vazio, não testa as outras
//   if (required == null && Validations.nonEmpty(value) != null) return null;
//
//   String msg;
//   for (Function validation in validations) {
//     msg = validation(value);
//     if (msg != null) return msg;
//   }
//
//   return null;
// }
}