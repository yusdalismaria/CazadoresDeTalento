import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';

import 'package:proyecto_pubsub/app/pages/publicador/publicador_controller.dart';
import 'package:proyecto_pubsub/app/routes/app_pages.dart';

class PublicadorPage extends GetView<PublicadorController> {
  const PublicadorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text("Mis publicaciones"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offNamed(Routes.creartrabajo);
        },
        child: const Icon(Icons.work),
      ),
      body: GetBuilder<PublicadorController>(builder: (_) {
        return SingleChildScrollView(
            child: SizedBox(
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
                future: controller.buscartrabajos(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<Trabajos> array = snapshot.data;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: array.length,
                    itemBuilder: (context, pos) {
                      return ListTile(
                          onTap: () {
                            Get.offNamed(Routes.creartrabajo, arguments: {
                              "item": array[pos],
                            });
                          },
                          title: Text(array[pos].nombretitulo.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(array[pos].nombreempresa.toString()),
                              Text(array[pos].nombretema.toString()),
                              Text(array[pos].nombretopico.toString()),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_right),
                          leading: Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 120,
                              decoration: const BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0))),
                              child: Text(
                                pos.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )));
                    },
                  );
                }),
          ),
        ));
      }),
    );
  }
}
