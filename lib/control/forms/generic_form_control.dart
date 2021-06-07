import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

abstract class FormControl {
  final formKey = GlobalKey<FormBuilderState>();
  final formData = Map<String, dynamic>();

  FormControl();

  void onChange(String key, dynamic val) => formData[key] = val;

  submit();
}
