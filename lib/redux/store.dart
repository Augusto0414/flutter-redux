import 'package:prueba_tecnica/redux/models/auth_state.dart';
import 'package:prueba_tecnica/redux/reducer/app_reducer.dart';
import 'package:redux/redux.dart';

import 'middleware/auth_middleware.dart';

Store<AuthState> createStore() {
  return Store<AuthState>(
    appReducer,
    initialState: AuthState.initial(),
    middleware: [authMiddleware],
  );
}
