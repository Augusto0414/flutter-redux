import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_tecnica/helpers/auth_validation.dart';
import 'package:prueba_tecnica/redux/actions/auth_action.dart';
import 'package:prueba_tecnica/redux/models/auth_state.dart';
import 'package:prueba_tecnica/screens/auth/widgets/box_decoration.dart';
import 'package:prueba_tecnica/screens/auth/widgets/elevated_button.dart';
import 'package:prueba_tecnica/screens/auth/widgets/input_decoration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: CustomBoxDecoration.build(),
              child: StoreConnector<AuthState, AuthState>(
                converter: (store) => store.state,
                builder: (context, authState) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Correo',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1E2939),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: CustomInputDecoration.build(
                            hintText: 'ejemplo@correo.com',
                            prefixIcon: const Icon(Icons.email_outlined),
                          ),
                          validator: (value) {
                            return AuthValidation.validateEmail(value);
                          },
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Correo',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF1E2939),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          decoration: CustomInputDecoration.build(
                            hintText: '********',
                            prefixIcon: const Icon(Icons.lock_outline),
                            isPassword: true,
                            obscurePassword: _obscurePassword,
                            togglePasswordVisibility: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            return AuthValidation.validatePassword(value);
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: CustomElevatedButton.build(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authState.status != AuthStatus.loading
                                  ? StoreProvider.of<AuthState>(
                                      context,
                                    ).dispatch(
                                      LoginAction(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    )
                                  : null;
                            }
                          },
                          child: Text(
                            '${authState.status == AuthStatus.loading ? 'Cargando...' : 'Iniciar sesión'}',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
