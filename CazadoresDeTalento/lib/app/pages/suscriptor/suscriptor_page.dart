import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';

import 'package:proyecto_pubsub/app/pages/suscriptor/page_one.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/page_two.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/suscriptor_controller.dart';

import 'delegate.dart';

class SuscriptorPage extends GetView<SuscriptorController> {
  const SuscriptorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[PageOne(), PageTwo()];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onItemTapped();
        },
        child: const Icon(Icons.play_arrow),
      ),
      appBar: AppBar(
        leading: Container(),
        title: const Text("Listado de Trabajos"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () async {
                Trabajos item =
                    await showSearch(context: context, delegate: MiDelegate())
                        as Trabajos;

                if (item != null) {
                  controller.suscribiendote(item);
                }
              })
        ],
      ),
      body: GetBuilder<SuscriptorController>(
        id: "pages",
        builder: (___) {
          return Container(
            child: pages.elementAt(controller.selectedIndex),
          );
        },
      ),
      /*   
     
    */
    );
  }
}
