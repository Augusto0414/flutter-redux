import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store store;
  const App({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba tecnica',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Center(child: Text('Hola mundo')),
      ),
    );
  }
}
