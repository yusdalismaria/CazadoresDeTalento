import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/registro/registro_controller.dart';
import 'package:proyecto_pubsub/app/widgets/textfield/text_field_suffix.dart';

// ignore: use_key_in_widget_constructors
class RegistroPage extends GetView<RegistroController> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Cazador de Talentos"),
      ),
      body: GetBuilder<RegistroController>(builder: (_) {
        return SingleChildScrollView(
          child: Container(
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * 0.15),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "FORMULARIO DE REGISTRO",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidgetSuffix(
                    hintText: 'Password',
                    obscureText: true,
                    prefixIconData: Icons.password_outlined,
                    controller: controller.password,
                    inputType: TextInputType.text,
                    validator: "Introduce tu password",
                  ),
                  GetBuilder<RegistroController>(
                      id: "tipousuario",
                      builder: (_) {
                        return ClipRRect(
                          child: Container(
                            color: Colors.grey.withOpacity(0.10),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              items: ["Publicador", "Suscriptor"]
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? item) {
                                controller.actualizarTipo(item.toString());
                              },
                              hint: Text(
                                controller.tipoUsuario.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.blue,
                    onPressed: () {
                      controller.registrarse();
                    },
                    child: const Text(
                      "Completar registro",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: Colors.green,
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Atras",
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
