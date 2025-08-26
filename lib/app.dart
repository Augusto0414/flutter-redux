import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba tecnica',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(child: Text('Hola mundo')),
    );
  }
}
