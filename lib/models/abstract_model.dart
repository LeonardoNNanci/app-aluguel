import 'package:flutter/material.dart';

abstract class AbstractModel {
  int id;
  String table;

  AbstractModel(this.id);

  @mustCallSuper
  AbstractModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
  }

  Map<String, dynamic> toMap();
}
