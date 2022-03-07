import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_pubsub/app/models/modelo_complejo.dart';
import 'package:proyecto_pubsub/app/models/trabajos.dart';

class MiDelegate extends SearchDelegate<Trabajos> {
  List<Trabajos>? mistrabajos = [];
  List<Trabajos>? pivote = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        progress: transitionAnimation,
        icon: AnimatedIcons.menu_arrow,
      ),
      onPressed: () {
        /*    print("LEADING ICCONSS");
        close(context, null); */
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // ignore: avoid_print
    print("RESULTADOS");
    return _contruirResultadosSugerencias();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("buildSuggestions");
    return _contruirResultadosSugerencias();
  }

  Widget _contruirResultadosSugerencias() {
    if (query.isNotEmpty) {
      mistrabajos = pivote!
          .where((x) =>
              x.nombretopico!.toUpperCase().contains(query.toUpperCase()))
          .toList();

      mistrabajos!.addAll(pivote!
          .where(
              (x) => x.nombretema!.toUpperCase().contains(query.toUpperCase()))
          .toList());

      mistrabajos!.addAll(pivote!
          .where((x) =>
              x.nombremodalidad!.toUpperCase().contains(query.toUpperCase()))
          .toList());

      mistrabajos = {for (var item in mistrabajos!) item.id: item}
          .entries
          .map((entry) => entry.value)
          .toList();

      return ListView.separated(
          itemCount: mistrabajos!.length,
          separatorBuilder: (_, i) => const Divider(),
          itemBuilder: (_, i) {
            return ListTile(
              title: Text((mistrabajos![i].nombreempresa.toString())),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text((mistrabajos![i].nombretopico.toString())),
                  Text((mistrabajos![i].nombremodalidad.toString())),
                  Text((mistrabajos![i].nombretema.toString())),
                  Text((mistrabajos![i].nombretitulo.toString())),
                ],
              ),
              onTap: () {},
            );
          });
    }
    return FutureBuilder<List<Trabajos>>(
        future: buscartrabajos(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Trabajos>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Trabajos>? items = snapshot.data;
          mistrabajos = List.from(items!);
          pivote = List.from(items);

          if (items.isEmpty) {
            return ListTile(
              title: Text('No hay resultados con $query'),
            );
          }

          return ListView.separated(
              itemCount: mistrabajos!.length,
              separatorBuilder: (_, i) => const Divider(),
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text((mistrabajos![i].nombreempresa.toString())),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((mistrabajos![i].nombretopico.toString())),
                      Text((mistrabajos![i].nombremodalidad.toString())),
                      Text((mistrabajos![i].nombretema.toString())),
                      Text((mistrabajos![i].nombretitulo.toString())),
                    ],
                  ),
                  onTap: () {
                    this.close(context, mistrabajos![i]);
                  },
                );
              });
        });
  }

  Future<List<Trabajos>> buscartrabajos() async {
    QuerySnapshot query =
        await FirebaseFirestore.instance.collection("trabajos").get();
    List<Trabajos> trabajos =
        query.docs.map((doc) => Trabajos.fromMap(doc)).toList();
    return trabajos;
  }
}
