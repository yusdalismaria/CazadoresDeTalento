import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:proyecto_pubsub/app/models/modelo_complejo.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';
import 'package:proyecto_pubsub/app/pages/login/controller/usuario_actual.dart';
import 'package:proyecto_pubsub/app/pages/publicador/crear_trabajo/service/obtener_informacion.dart';
import 'package:proyecto_pubsub/app/routes/app_pages.dart';
import 'package:proyecto_pubsub/app/widgets/toast.dart';

class CrearTrabajoController extends GetxController {
  ModeloComplejo empresa = ModeloComplejo(nombre: "Selecciona una opcion");
  ModeloComplejo modalidad = ModeloComplejo(nombre: "Selecciona una opcion");
  ModeloComplejo tema = ModeloComplejo(nombre: "Selecciona una opcion");
  ModeloComplejo topicos = ModeloComplejo(nombre: "Selecciona una opcion");
  ModeloComplejo titulo = ModeloComplejo(nombre: "Selecciona una opcion");
  
  UsuarioActualController user = Get.find();
  ObtenerInformacion obtenerInformacion = ObtenerInformacion();
  bool estaEditando = false;
  Trabajos? trabajo;

  @override
  void onReady() async {
    super.onReady();
    if (Get.routing.args != null) {
      trabajo = Get.routing.args["item"] as Trabajos;

      empresa.nombre = trabajo?.nombreempresa;
      empresa.id = trabajo?.empresa;
      //*--------------
      modalidad.nombre = trabajo?.nombremodalidad;
      modalidad.id = trabajo?.modalidad;

      //*--------------
      tema.id = trabajo?.tema;
      tema.nombre = trabajo?.nombretema;
      //*--------------
      titulo.id = trabajo?.titulo;
      titulo.nombre = trabajo?.nombretitulo;
      //*--------------
      topicos.id = trabajo?.topico;
      topicos.nombre = trabajo?.nombretopico;
      estaEditando = true;
      update(["creartrabajo"]);
    }
  }

  void editandoTrabajo() async {
    Trabajos trabajoEditado = Trabajos(
      email: user.user.email,
      nombreempresa: empresa.nombre,
      empresa: empresa.id,
      modalidad: modalidad.id,
      nombremodalidad: modalidad.nombre,
      nombretema: tema.nombre,
      nombretitulo: titulo.nombre,
      nombretopico: topicos.nombre,
      tema: tema.id,
      titulo: titulo.id,
      topico: topicos.id,
      fecha: DateTime.now().toString()
    );

    await FirebaseFirestore.instance
        .collection("trabajos")
        .doc(trabajo!.id)
        .update(trabajoEditado.toMap())
        .then((value) {
      toastSubmit("Trabajo editado");
      Get.offNamed(Routes.publicador);
    });
  }

  void cambiarEmpresa(ModeloComplejo item) {
    empresa = item;
    update(["cambiarEmpresa", "creartrabajo"]);
  }

  void cambiarModalidad(ModeloComplejo item) {
    modalidad = item;
    update(["cambiarModalidad", "creartrabajo"]);
  }

  void cambiarTema(ModeloComplejo item) {
    tema = item;
    update(["cambiarTema", "creartrabajo"]);
  }

  void cambiarTitulo(ModeloComplejo item) {
    titulo = item;
    update(["cambiarTitulo", "creartrabajo"]);
  }

  void cambiarTopicos(ModeloComplejo item) {
    topicos = item;
    update(["cambiarTopicos", "creartrabajo"]);
  }

  void guardarTrabajo() async {
    Trabajos trabajo = Trabajos(
      email: user.user.email,
      nombreempresa: empresa.nombre,
      empresa: empresa.id,
      modalidad: modalidad.id,
      nombremodalidad: modalidad.nombre,
      estado: 0,
      fecha: DateTime.now().toString(),
      nombretema: tema.nombre,
      nombretitulo: titulo.nombre,
      nombretopico: topicos.nombre,
      tema: tema.id,
      titulo: titulo.id,
      topico: topicos.id,
    );
    await FirebaseFirestore.instance
        .collection("trabajos")
        .doc()
        .set(trabajo.toMap())
        .then((value) {
      toastSubmit("Trabajo registrado");
      Get.offNamed(Routes.publicador);
    });
  }
}
