import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class KeyboardInputField extends StatelessWidget {
  final String initialValue;
  final String name;
  final String label;
  final String hint;
  final IconData icon;
  final String prefix;
  final String suffix;
  final TextInputType keyboardType;
  final TextCapitalization capitalization;
  final List<String Function(String)> validations;
  final void Function(String) onChanged;

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
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormBuilderTextField(
        name: name,
        initialValue: initialValue,
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
        onChanged: onChanged,
      ),
    );
  }
}
