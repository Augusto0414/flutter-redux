import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:prueba_tecnica/redux/models/auth_state.dart';
import 'package:prueba_tecnica/screens/auth/login.dart';
import 'package:prueba_tecnica/screens/home/home.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AuthState> store;
  const App({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AuthState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba tecnica',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const Login(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
