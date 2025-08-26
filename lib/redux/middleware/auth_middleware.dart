import 'package:prueba_tecnica/redux/actions/auth_action.dart';
import 'package:prueba_tecnica/redux/models/auth_state.dart';
import 'package:redux/redux.dart';

void authMiddleware(
  Store<AuthState> store,
  dynamic action,
  NextDispatcher next,
) async {
  if (action is LoginAction) {
    next(action);
    await Future.delayed(Duration(seconds: 2));
    try {
      if (action.email == 'test@redux.com' && action.password == '123456') {
        store.dispatch(LoginSuccessAction(token: 'dummy_token'));
      } else {
        store.dispatch(AuthErrorAction(error: 'Invalid username or password'));
      }
    } catch (e) {
      store.dispatch(AuthErrorAction(error: e.toString()));
    }
    return;
  }
  next(action);
}
