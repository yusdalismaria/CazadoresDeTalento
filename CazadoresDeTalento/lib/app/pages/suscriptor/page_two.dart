import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/modelo_complejo.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/suscriptor_controller.dart';
import 'package:proyecto_pubsub/app/widgets/dropdown.dart';

class PageTwo extends StatelessWidget {
  // const PageOne({Key? key}) : super(key: key);
  SuscriptorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuscriptorController>(
        id: "page_two",
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              width: Get.width,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Topicos",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      superFutureBuilder(
                          "topicos",
                          "cambiarTopicos",
                          controller.topicos.nombre.toString(),
                          controller.cambiarTopicos),
                      const Text(
                        "Modalidad",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      superFutureBuilder(
                          "modalidad",
                          "cambiarModalidad",
                          controller.modalidad.nombre.toString(),
                          controller.cambiarModalidad),
                      const Text(
                        "Temas",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      superFutureBuilder(
                          "tema",
                          "cambiarTema",
                          controller.tema.nombre.toString(),
                          controller.cambiarTema),
                      MaterialButton(
                        height: 50.0,
                        minWidth: Get.width,
                        color: Colors.blue,
                        onPressed: () async {
                          controller.guardandoSuscripcion();
                        },
                        child: const Text(
                          "Guardar",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }

  Widget superFutureBuilder(
      String? nombreTabla, String id, String textoMostrado, Function function) {
    return FutureBuilder<List<ModeloComplejo>>(
      future: controller.obtenerInformacion.service("$nombreTabla"),
      builder: (BuildContext __, AsyncSnapshot<List<ModeloComplejo>> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("No existen registros de empresas"),
          );
        }

        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GetBuilder<SuscriptorController>(
            id: id,
            builder: (_) {
              //controller.item = ;
              return DynamicCustomDropwDownList(
                textMostrado: textoMostrado,
                snapshot: snapshot.data,
                functionChange: function,
                misuperTexto: "nombre",
              );
            });
      },
    );
  }
}
