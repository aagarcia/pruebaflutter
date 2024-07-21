// To parse this JSON data, do
//
//     final cancha = canchaFromJson(jsonString);

import 'dart:convert';

Cancha canchaFromJson(String str) => Cancha.fromJson(json.decode(str));

String canchaToJson(Cancha data) => json.encode(data.toJson());

class Cancha {
  int? id;
  String nombre;
  String tipo;
  String horaIni;
  String horaFin;
  String direccion;
  String disponibilidad;
  double valor;
  String imageUrl;

  Cancha({
    this.id,
    required this.nombre,
    required this.tipo,
    required this.horaIni,
    required this.horaFin,
    required this.direccion,
    required this.disponibilidad,
    required this.valor,
    required this.imageUrl,
  });

  factory Cancha.fromJson(Map<String, dynamic> json) => Cancha(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        horaIni: json["horaIni"],
        horaFin: json["horaFin"],
        direccion: json["direccion"],
        disponibilidad: json["disponibilidad"],
        valor: json["valor"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "horaIni": horaIni,
        "horaFin": horaFin,
        "direccion": direccion,
        "disponibilidad": disponibilidad,
        "valor": valor,
        "imageUrl": imageUrl,
      };
}
