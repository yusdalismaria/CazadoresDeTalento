import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/modelo_complejo.dart';
import 'package:proyecto_pubsub/app/pages/publicador/crear_trabajo/crear_trabajo_controller.dart';
import 'package:proyecto_pubsub/app/widgets/dropdown.dart';

class CrearTrabajoPage extends GetView<CrearTrabajoController> {
  const CrearTrabajoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Crear Trabajo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(controller.estaEditando){
            //
               controller.editandoTrabajo();
          }else{
               controller.guardarTrabajo();
          }
       
        },
        child: Icon(Icons.save),
      ),
      body: GetBuilder<CrearTrabajoController>(
          id: "creartrabajo",
          builder: (_) {
            return SingleChildScrollView(
              child: Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Empresa",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      superFutureBuilder(
                          "empresa",
                          "cambiarEmpresa",
                          controller.empresa.nombre.toString(),
                          controller.cambiarEmpresa),
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
                      const Text(
                        "Titulo",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      superFutureBuilder(
                          "titulo",
                          "cambiarTitulo",
                          controller.titulo.nombre.toString(),
                          controller.cambiarTitulo),
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
                    ],
                  ),
                ),
              ),
            );
          }),
    );
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
        return GetBuilder<CrearTrabajoController>(
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
