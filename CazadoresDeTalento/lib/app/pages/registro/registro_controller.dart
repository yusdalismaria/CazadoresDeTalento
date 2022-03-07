import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/widgets/toast.dart';

class RegistroController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String? tipoUsuario = "Publicador";
  void registrarse() async {
    try {
      //provider.setLoading = true;

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((currentUser) => {
                FirebaseFirestore.instance
                    .collection("usuarios")
                    .doc(currentUser.user?.uid)
                    .set({
                  "uid": currentUser.user?.uid,
                  "email": email.text,
                  "tipo_usuario": tipoUsuario,
                  "estado": "Activo",
                }).then((value) {
                  toastSubmit("Usuario registrado");
                  Get.back();
                })
              });
    } catch (e) {
      /*    provider.setLoading = false;
      toast.show(await validateUser.getException(e), Colors.red, Colors.white); */
    }
  }

  void actualizarTipo(String tipo) {
    tipoUsuario = tipo;
    update(["tipousuario"]);
  }
}
