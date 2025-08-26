import 'package:prueba_tecnica/models/user.dart';

enum AuthStatus { authenticated, unauthenticated, loading }

class AuthState {
  final User? user;
  final String? error;
  final String? token;
  final AuthStatus status;

  AuthState({
    this.user,
    this.error,
    this.token,
    this.status = AuthStatus.unauthenticated,
  });

  AuthState copyWith({
    User? user,
    String? error,
    String? token,
    AuthStatus? status,
  }) {
    return AuthState(
      user: user ?? this.user,
      error: error ?? this.error,
      token: token ?? this.token,
      status: status ?? this.status,
    );
  }

  factory AuthState.initial() => AuthState(
    user: null,
    status: AuthStatus.unauthenticated,
    error: null,
    token: null,
  );
}
