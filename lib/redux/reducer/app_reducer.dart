import 'package:prueba_tecnica/redux/models/auth_state.dart';
import 'package:prueba_tecnica/redux/reducer/auth_reducer.dart';

AuthState appReducer(AuthState state, dynamic action) {
  state = authReducer(state, action);
  return state;
}
