import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputDecoration {
  static InputDecoration build({
    required String hintText,
    required Icon prefixIcon,
    bool isPassword = false,
    bool obscurePassword = true,
    VoidCallback? togglePasswordVisibility,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF1E2939),
      ),
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF007C35), width: 2),
      ),
      suffixIcon: isPassword
          ? IconButton(
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: togglePasswordVisibility,
            )
          : null,
    );
  }
}
