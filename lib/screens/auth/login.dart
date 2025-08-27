import 'index.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        width: double.infinity,
        height: double.infinity,
        decoration: _buildGradientDecoration(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: const CustomHeader(),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 36.0, bottom: 16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: CustomBoxDecoration.build(),
                child: StoreConnector<AuthState, AuthState>(
                  converter: (store) => store.state,
                  onDidChange: (previousState, newState) {
                    if (previousState?.token == null &&
                        newState.token != null) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    }
                  },
                  builder: (context, authState) {
                    return Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildEmailField(),
                          const SizedBox(height: 15),
                          _buildPasswordField(),
                          const SizedBox(height: 20),
                          _buildLoginButton(authState),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(AuthState authState) {
    final isLoading = authState.status == AuthStatus.loading;
    return ElevatedButton(
      style: CustomElevatedButton.build(),
      onPressed: isLoading ? null : _handleLogin,
      child: Text(
        isLoading ? 'Cargando...' : 'Iniciar sesión',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Correo'),
        const SizedBox(height: 4),
        TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: CustomInputDecoration.build(
            hintText: 'ejemplo@correo.com',
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          validator: AuthValidation.validateEmail,
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel('Contraseña'),
        const SizedBox(height: 4),
        TextFormField(
          controller: _passwordController,
          obscureText: _obscurePassword,
          decoration: CustomInputDecoration.build(
            hintText: '********',
            prefixIcon: const Icon(Icons.lock_outline),
            isPassword: true,
            obscurePassword: _obscurePassword,
            togglePasswordVisibility: _togglePasswordVisibility,
          ),
          validator: AuthValidation.validatePassword,
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF1E2939),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildGradientDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFFFFFFF), Color(0xFFFFFFFF), Color(0xFFE6F2EC)],
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;
    StoreProvider.of<AuthState>(context).dispatch(
      LoginAction(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      ),
    );
  }
}
