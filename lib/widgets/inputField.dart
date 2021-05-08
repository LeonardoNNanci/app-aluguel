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
  final Function validation;

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
    this.validation,
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
        validator: validation,
      ),
    );
  }
}
