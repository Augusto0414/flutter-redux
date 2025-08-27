import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24.0),
      margin: const EdgeInsets.only(top: 46.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bienvenido de nuevo',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E2939),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Inicia sesión con tu cuenta para continuar y acceder a todas las funcionalidades.',
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF475467),
            ),
          ),
        ],
      ),
    );
  }
}
