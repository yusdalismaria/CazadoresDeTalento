import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/publicador/crear_trabajo/crear_trabajo_controller.dart';

class CrearTrabajoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CrearTrabajoController>(() => CrearTrabajoController());
  }
}
