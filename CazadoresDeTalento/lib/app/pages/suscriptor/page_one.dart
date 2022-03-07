import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/suscriptor_controller.dart';

class PageOne extends StatelessWidget {
  // const PageOne({Key? key}) : super(key: key);
  SuscriptorController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuscriptorController>(builder: (_) {
      return SingleChildScrollView(
        child: Container(
          width: Get.width,
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
                          onTap: () {},
                          title: Text(array[pos].nombretitulo.toString()),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(array[pos].nombreempresa.toString()),
                              Text(array[pos].nombretema.toString()),
                              Text(array[pos].nombretopico.toString()),
                              Text(array[pos].fecha.toString()),
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
        ),
      );
    });
  }
}
