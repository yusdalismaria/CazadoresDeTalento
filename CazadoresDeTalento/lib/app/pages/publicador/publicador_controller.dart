import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';
import 'package:proyecto_pubsub/app/pages/login/controller/usuario_actual.dart';

class PublicadorController extends GetxController {
  UsuarioActualController usuario = Get.find();

  /* List<Trabajos> trabajos = []; */
  Future<List<Trabajos>> buscartrabajos() async {
    QuerySnapshot query = await FirebaseFirestore.instance
        .collection("trabajos")
        .where("email", isEqualTo: usuario.user.email)
        .get();
    List<Trabajos> trabajos =
        query.docs.map((doc) => Trabajos.fromMap(doc)).toList();
    return trabajos;
  }
}
