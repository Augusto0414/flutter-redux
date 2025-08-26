class LoginAction {
  final String email;
  final String password;

  LoginAction({required this.email, required this.password});
}

class LogoutAction {}

class AuthErrorAction {
  final String error;

  AuthErrorAction({required this.error});
}
