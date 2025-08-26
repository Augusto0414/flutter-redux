import 'package:prueba_tecnica/redux/actions/auth_action.dart';
import 'package:prueba_tecnica/redux/models/auth_state.dart';

AuthState authReducer(AuthState state, dynamic action) {
  if (action is LoginAction) {
    return state.copyWith(status: AuthStatus.loading);
  }
  if (action is LoginSuccessAction) {
    return state.copyWith(
      status: AuthStatus.authenticated,
      token: action.token,
      error: null,
    );
  }
  if (action is AuthErrorAction) {
    return state.copyWith(
      status: AuthStatus.unauthenticated,
      error: action.error,
    );
  }
  if (action is LogoutAction) {
    return AuthState.initial();
  }
  return state;
}
