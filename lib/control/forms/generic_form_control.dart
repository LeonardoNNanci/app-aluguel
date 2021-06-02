import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

abstract class FormControl {
  final GlobalKey<FormBuilderState> formKey;
  Map<String, dynamic> formData = Map<String, dynamic>();

  FormControl(this.formKey);

  void onChange(String key, dynamic val) => formData[key] = val;

  submit();
}
