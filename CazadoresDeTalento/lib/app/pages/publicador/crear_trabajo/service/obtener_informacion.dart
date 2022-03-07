import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:proyecto_pubsub/app/models/modelo_complejo.dart';

class ObtenerInformacion {
  Future<List<ModeloComplejo>> service(String? tabla) async {
    QuerySnapshot docs =
        await FirebaseFirestore.instance.collection('$tabla').get();

    List<ModeloComplejo> item = [];
    for (var i = 0; i < docs.docs.length; i++) {
      item.add(ModeloComplejo.fromMap(docs.docs[i]));
    }

    if (item.length == 0) return [];
    return item;
  }
}
