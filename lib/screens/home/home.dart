import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:prueba_tecnica/redux/actions/auth_action.dart';
import 'package:prueba_tecnica/redux/models/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AuthState, AuthState>(
      distinct: true,
      converter: (store) => store.state,
      builder: (context, authState) {
        if (authState.status == AuthStatus.unauthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/login');
          });
        }

        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildWelcomeMessage(),
              const SizedBox(height: 20),
              StoreConnector<AuthState, VoidCallback>(
                converter: (store) =>
                    () => store.dispatch(LogoutAction()),
                builder: (context, logoutCallback) {
                  return _buildLogoutButton(logoutCallback);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWelcomeMessage() {
    return const Center(
      child: Text(
        'Welcome to the Home Page!',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLogoutButton(VoidCallback logoutCallback) {
    return ElevatedButton(
      onPressed: logoutCallback,
      child: const Text('Logout'),
    );
  }
}
