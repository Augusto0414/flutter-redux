import 'package:prueba_tecnica/redux/actions/auth_action.dart';
import 'package:prueba_tecnica/redux/models/auth_state.dart';
import 'package:redux/redux.dart';

void authMiddleware(
  Store<AuthState> store,
  dynamic action,
  NextDispatcher next,
) async {
  if (action is LoginAction) {
    await Future.delayed(Duration(seconds: 2));
    store.dispatch(LogoutAction());
  }

  next(action);
}
