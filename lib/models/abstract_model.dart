import 'package:flutter/material.dart';

abstract class AbstractModel {
  int id;
  String table;
  String idField;

  AbstractModel(this.id, this.table, this.idField);

  AbstractModel.empty(this.table, this.idField);

  @mustCallSuper
  AbstractModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
  }

  Map<String, dynamic> toMap();
}
