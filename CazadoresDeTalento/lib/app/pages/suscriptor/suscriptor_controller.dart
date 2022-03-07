import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:proyecto_pubsub/app/models/modelo_complejo.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';
import 'package:proyecto_pubsub/app/pages/login/controller/usuario_actual.dart';
import 'package:proyecto_pubsub/app/pages/publicador/crear_trabajo/service/obtener_informacion.dart';
import 'package:proyecto_pubsub/app/widgets/toast.dart';

class SuscriptorController extends GetxController {
  int selectedIndex = 0;
  ModeloComplejo modalidad = ModeloComplejo(nombre: "Selecciona una opcion");
  ModeloComplejo tema = ModeloComplejo(nombre: "Selecciona una opcion");
  ModeloComplejo topicos = ModeloComplejo(nombre: "Selecciona una opcion");
  ObtenerInformacion obtenerInformacion = ObtenerInformacion();
  UsuarioActualController user = Get.find();
  Future<List<Trabajos>> buscartrabajos() async {
    QuerySnapshot query =
        await FirebaseFirestore.instance.collection("trabajos").get();
    List<Trabajos> trabajos =
        query.docs.map((doc) => Trabajos.fromMap(doc)).toList();
    return trabajos;
  }

  void onItemTapped() async {
    if (selectedIndex == 1) {
      selectedIndex = 0;
      update(["pages"]);
    } else {
      selectedIndex = 1;

      update(["pages"]);
    }
  }

  void cambiarTopicos(ModeloComplejo item) {
    topicos = item;
    update(["page_two"]);
  }

  void cambiarModalidad(ModeloComplejo item) {
    modalidad = item;
    update(["page_two"]);
  }

  void cambiarTema(ModeloComplejo item) {
    tema = item;
    update(["page_two"]);
  }

  @override
  void onReady() async {
    super.onReady();

    //*--------------
    if (user.user.nombremodalidad != null) {
      modalidad.nombre = user.user.nombremodalidad;
      modalidad.id = user.user.modalidad;
      //*--------------
      tema.id = user.user.tema;
      tema.nombre = user.user.nombretema;
      //*--------------
      topicos.id = user.user.topico;
      topicos.nombre = user.user.nombretopico;

      update(["page_two"]);
    }
  }

  void guardandoSuscripcion() async {
    user.user.modalidad = modalidad.id;
    user.user.nombremodalidad = modalidad.nombre;
    user.user.tema = tema.id;
    user.user.nombretema = tema.nombre;
    user.user.topico = topicos.id;
    user.user.nombretopico = topicos.nombre;

    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user.user.id)
        .update(user.user.toMap())
        .then((value) {
      toastSubmit("Te suscribiste a estos puntos");
      /*  Get.offNamed(Routes.publicador); */
    });
  }

  void suscribiendote(Trabajos trabajo) async {
    user.user.modalidad = trabajo.modalidad.toString();
    user.user.nombremodalidad = trabajo.nombremodalidad.toString();
    user.user.tema = trabajo.tema;
    user.user.nombretema = trabajo.nombretema;
    user.user.topico = trabajo.topico;
    user.user.nombretopico = trabajo.nombretopico;

    await FirebaseFirestore.instance
        .collection("usuarios")
        .doc(user.user.id)
        .update(user.user.toMap())
        .then((value) {
      toastSubmit("Te suscribiste a estos puntos");
      enviarCorreo();
      /*  Get.offNamed(Routes.publicador); */
    });
  }

  void enviarCorreo() async {
    //colocar correo
    String correo = 'yusdalismmg@gmail.com';
    String password = '********************';

    final smtpServer = gmail(correo, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(correo, 'Your name')
      ..recipients.add(
        'yusdalismmg@gmail.com',
      )
      ..ccRecipients
          .addAll(['yusdalismmg@gmail.com', 'dannaelizabethrb@gmail.com'])
      ..bccRecipients
          .add(Address('yusdalismmg@gmail.com', "dannaelizabethrb@gmail.com"))
      ..subject = 'SUSCRIPCION A CAZADORES DE TALENTOS ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html = "<h1>¡HOLA!</h1>\n<p>GRACIAS POR RELIZAR SU SUSCRIPCION</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.' + e.toString());
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
