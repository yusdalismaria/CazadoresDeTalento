


import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/publicador/publicador_controller.dart';

class PublicadorBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<PublicadorController>(() => PublicadorController(
  ));
  }
}