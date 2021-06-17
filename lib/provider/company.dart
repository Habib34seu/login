import 'package:flutter/material.dart';
class Company {
  int id;
  String nombre;

  Company({@required this.id, @required this.nombre});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    return data;
  }
}
