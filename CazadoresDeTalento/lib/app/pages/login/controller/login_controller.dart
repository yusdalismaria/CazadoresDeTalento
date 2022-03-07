import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:proyecto_pubsub/app/models/usuario.dart';

import 'package:proyecto_pubsub/app/pages/login/controller/usuario_actual.dart';
import 'package:proyecto_pubsub/app/routes/app_pages.dart';
import 'package:proyecto_pubsub/app/widgets/toast.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onReady() {
    email.text = "franco@gmail.com";
    password.text = "123456";
    super.onReady();
  }

  void iniciarSesion() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((UserCredential currentUser) async {
        QuerySnapshot query = await FirebaseFirestore.instance
            .collection("usuarios")
            .where("email", isEqualTo: email.text.trim())
            .get();

        Usuarios user = new Usuarios.fromMap(query.docs[0]);
        tipodeUsuario(user);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void tipodeUsuario(Usuarios user) async {
    UsuarioActualController usuarioActualController = Get.find();
    usuarioActualController.setUser(user);

    if (user.tipoUsuarios == "Publicador") {
      Get.offAllNamed(Routes.publicador);
    } else {
      Get.offAllNamed(Routes.suscriptor);
    }
  }
}
