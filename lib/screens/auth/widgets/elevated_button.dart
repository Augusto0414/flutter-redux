import 'package:flutter/material.dart';

class CustomElevatedButton {
  static ButtonStyle build() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF007C35),
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
    );
  }
}
