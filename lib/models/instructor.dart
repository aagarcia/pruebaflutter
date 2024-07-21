// To parse this JSON data, do
//
//     final instructores = instructoresFromJson(jsonString);

import 'dart:convert';

Instructor instructorFromJson(String str) =>
    Instructor.fromJson(json.decode(str));

String instructorToJson(Instructor data) => json.encode(data.toJson());

class Instructor {
  int? id;
  String nombre;

  Instructor({
    this.id,
    required this.nombre,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };
}
