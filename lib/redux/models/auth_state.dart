import 'package:prueba_tecnica/models/user.dart';

enum AuthStatus { authenticated, unauthenticated, loading }

class AuthState {
  final User? user;
  final String? error;
  final AuthStatus status;

  AuthState({this.user, this.error, this.status = AuthStatus.unauthenticated});

  AuthState copyWith({User? user, String? error, AuthStatus? status}) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  factory AuthState.initial() =>
      AuthState(user: null, status: AuthStatus.unauthenticated, error: null);
}
