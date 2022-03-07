

import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/usuario.dart';

class UsuarioActualController extends GetxController {
  Usuarios user = Usuarios();
  

  void setUser(Usuarios data) {
    user = data;
  }

 
}
