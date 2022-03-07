import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/login/controller/login_controller.dart';

import 'package:proyecto_pubsub/app/routes/app_pages.dart';
import 'package:proyecto_pubsub/app/widgets/textfield/text_field_suffix.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Cazador de Talentos"),
      ),
      body: GetBuilder<LoginController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "FORMULARIO DE INICIO DE SESION",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidgetSuffix(
                    hintText: 'Correo electronico (Usuario)',
                    obscureText: false,
                    prefixIconData: Icons.mail_outline,
                    controller: controller.email,
                    inputType: TextInputType.emailAddress,
                    validator: "Introduce tu correo electronico valido",
                  ),
                  GetBuilder<LoginController>(
                      id: "super_password",
                      builder: (_) {
                        return TextFieldWidgetSuffix(
                          validator: "Introduce tu contraseña",
                          controller: controller.password,
                          inputType: TextInputType.text,
                          hintText: 'Password',
                          obscureText: true,
                          prefixIconData: Icons.lock_outline,
                        );
                      }),
                  SizedBox(height: height * 0.25),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.blue,
                    onPressed: () {
                      controller.iniciarSesion();
                    },
                    child: const Text(
                      "Iniciar sesion",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.green,
                    onPressed: () {
                      Get.toNamed(Routes.registro);
                    },
                    child: const Text(
                      "Registrarse",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
