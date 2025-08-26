class LoginAction {
  final String email;
  final String password;
  LoginAction({required this.email, required this.password});
}

class LogoutAction {}

class LoginSuccessAction {
  final String token;
  LoginSuccessAction({required this.token});
}

class AuthErrorAction {
  final String error;
  AuthErrorAction(String s, {required this.error});
}
