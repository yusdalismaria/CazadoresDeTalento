import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/registro/registro_controller.dart';

class RegistroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistroController>(() => RegistroController());
  }
}
