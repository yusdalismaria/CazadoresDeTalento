import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Trabajos fotosFromMap(String str) => Trabajos.fromMap(json.decode(str));

String fotosToMap(Trabajos data) => json.encode(data.toMap());

class Trabajos {
  String? id;
  String? email;
  String? empresa;
  String? nombreempresa;
  int? estado;
  String? fecha;
  String? modalidad;
  String? nombremodalidad;
  String? tema;
  String? nombretema;
  String? titulo;
  String? nombretitulo;
  String? topico;
  String? nombretopico;

  Trabajos({
     this.id,
    required this.email,
    required this.empresa,
     this.estado,
     this.fecha,
    required this.modalidad,
    required this.tema,
    required this.titulo,
    required this.topico,
    required this.nombreempresa,
    required this.nombremodalidad,
    required this.nombretema,
    required this.nombretitulo,
    required this.nombretopico,
  });

  factory Trabajos.fromMap(DocumentSnapshot doc) => Trabajos(
        id: doc.id,
        email: doc.data()!['email'],
        empresa: doc.data()!['empresa'],
        estado: doc.data()!['estado'],
        fecha: doc.data()!['fecha'].toString(),
        modalidad: doc.data()!['modalidad'],
        tema: doc.data()!['tema'],
        titulo: doc.data()!['titulo'],
        topico: doc.data()!['topico'],
        nombreempresa: doc.data()!['nombreempresa'],
        nombremodalidad: doc.data()!['nombremodalidad'],
        nombretema: doc.data()!['nombretema'],
        nombretitulo: doc.data()!['nombretitulo'],
        nombretopico: doc.data()!['nombretopico'],
      );

  Map<String, dynamic> toMap() => {
        "nombreempresa": (nombreempresa),
        "nombremodalidad": (nombremodalidad),
        "nombretema": (nombretema),
        "nombretitulo": (nombretitulo),
        "nombretopico": (nombretopico),
        "email": (email),
        "estado": (estado),
        "fecha": (fecha),
        "empresa": (empresa),
        "modalidad": (modalidad),
        "tema": (tema),
        "titulo": (titulo),
        "topico": (topico),
      };
}
