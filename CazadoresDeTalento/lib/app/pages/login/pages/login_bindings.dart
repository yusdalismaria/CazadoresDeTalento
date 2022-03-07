
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/login/controller/login_controller.dart';
import 'package:proyecto_pubsub/app/pages/login/controller/usuario_actual.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    
    Get.put<UsuarioActualController>(UsuarioActualController(),
        permanent: true);
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
