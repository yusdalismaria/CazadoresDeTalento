import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/suscriptor_controller.dart';

class SuscriptorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuscriptorController>(() => SuscriptorController());
  }
}
