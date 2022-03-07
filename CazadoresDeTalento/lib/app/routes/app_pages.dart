import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/pages/login/pages/login_bindings.dart';
import 'package:proyecto_pubsub/app/pages/login/pages/login_page.dart';
import 'package:proyecto_pubsub/app/pages/publicador/crear_trabajo/crear_trabajo_bindings.dart';
import 'package:proyecto_pubsub/app/pages/publicador/crear_trabajo/crear_trabajo_page.dart';
import 'package:proyecto_pubsub/app/pages/publicador/publicador_bindings.dart';
import 'package:proyecto_pubsub/app/pages/publicador/publicador_page.dart';
import 'package:proyecto_pubsub/app/pages/registro/registro_bindings.dart';
import 'package:proyecto_pubsub/app/pages/registro/registro_page.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/suscriptor_bindings.dart';
import 'package:proyecto_pubsub/app/pages/suscriptor/suscriptor_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.login,
      binding: LoginBinding(),
      page: () => const LoginPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.registro,
      binding: RegistroBinding(),
      page: () => RegistroPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.publicador,
      binding: PublicadorBinding(),
      page: () => const PublicadorPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.creartrabajo,
      binding: CrearTrabajoBinding(),
      page: () => const CrearTrabajoPage(),
      transition: Transition.fadeIn,
    ),

     GetPage(
      name: Routes.suscriptor,
      binding: SuscriptorBinding(),
      page: () => const SuscriptorPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
