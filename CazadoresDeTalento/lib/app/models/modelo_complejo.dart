import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ModeloComplejo fotosFromMap(String str) =>
    ModeloComplejo.fromMap(json.decode(str));

String fotosToMap(ModeloComplejo data) => json.encode(data.toMap());

class ModeloComplejo {
  String? id;
  String? nombre;

  ModeloComplejo({
    this.id,
    this.nombre,
  });

  factory ModeloComplejo.fromMap(DocumentSnapshot doc) => ModeloComplejo(
        id: doc.id,
        nombre: doc.data()!['nombre'],
      );

  Map<String, dynamic> toMap() => {
        "uid": (id),
        "nombre": (nombre),
      };
}
