import 'package:flutter/material.dart';
import 'package:prueba_tecnica/app.dart';
import 'package:prueba_tecnica/redux/store.dart';

void main() {
  final store = createStore();
  runApp(App(store: store));
}
