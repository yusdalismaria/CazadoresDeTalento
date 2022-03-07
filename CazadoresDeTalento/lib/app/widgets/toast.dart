import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

void toastCatch(String texto) {
  Fluttertoast.showToast(
    msg: texto,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 18,
  );
}

void toastSubmit(String title) {
  Fluttertoast.showToast(
    msg: title,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 18,
  );
}
