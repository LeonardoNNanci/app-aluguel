import 'package:flutter/material.dart';

abstract class DatabaseModel{
  int id;

  DatabaseModel(this.id);
  DatabaseModel.fromMap(Map<String, dynamic> map){
    this.id = map["id"];
  }

  Map<String, dynamic> toMap();
}

