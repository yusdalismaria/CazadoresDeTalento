import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Usuarios fotosFromMap(String str) => Usuarios.fromMap(json.decode(str));

String fotosToMap(Usuarios data) => json.encode(data.toMap());

class Usuarios {
  String? id;
  String? email;
  String? tipoUsuarios;
  String? estado;

  String? modalidad;
  String? nombremodalidad;
  String? tema;
  String? nombretema;
  String? topico;
  String? nombretopico;

  Usuarios({
    this.id,
    this.estado,
    this.email,
    this.tipoUsuarios,
    this.modalidad,
    this.tema,
    this.topico,
    this.nombremodalidad,
    this.nombretema,
    this.nombretopico,
  });

  factory Usuarios.fromMap(DocumentSnapshot doc) => Usuarios(
        id: doc.id,
        email: (doc.data()!["email"]),
        estado: (doc.data()!["estado"]),
        tipoUsuarios: (doc.data()!["tipo_usuario"]),
        modalidad: doc.data()!['modalidad'],
        tema: doc.data()!['tema'],
        topico: doc.data()!['topico'],
        nombremodalidad: doc.data()!['nombremodalidad'],
        nombretema: doc.data()!['nombretema'],
        nombretopico: doc.data()!['nombretopico'],
      );

  Map<String, dynamic> toMap() => {
        "uid": (id),
        "email": (email),
        "estado": (estado),
        "tipo_usuario": (tipoUsuarios),
        "nombremodalidad": (nombremodalidad),
        "nombretema": (nombretema),
        "nombretopico": (nombretopico),
        "modalidad": (modalidad),
        "tema": (tema),
        "topico": (topico),
      };
}
