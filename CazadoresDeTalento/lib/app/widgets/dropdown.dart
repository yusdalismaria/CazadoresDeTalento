import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DynamicCustomDropwDownList extends StatelessWidget {
  final List<dynamic>? snapshot;
  final String? textMostrado;
  Function? functionChange;
  final String? misuperTexto;

  DynamicCustomDropwDownList({
    Key? key,
    @required this.snapshot,
    @required this.textMostrado,
    @required this.functionChange,
    @required this.misuperTexto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      /*    color: CustomColors.colorBlue.withOpacity(0.45), */
      child: Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: DropdownButton<dynamic>(
          itemHeight: 50,
          underline: Container(),
          items: snapshot!
              .map((data) => DropdownMenuItem<dynamic>(
                    child: misuperWidget(misuperTexto!, data),
                    value: data,
                  ))
              .toList(),
          onChanged: (value) => functionChange!(value),
          isExpanded: true,
          hint: Text(
            textMostrado!,
          ),
        ),
      ),
    );
  }

  Widget misuperWidget(String texto, dynamic data) {
    switch (texto) {
      case "nombre":
        return Text(
          data.nombre.toString(),
        );

      default:
        return Text("error en mi super widget");
    }
  }
}
