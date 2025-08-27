import 'package:flutter/material.dart';

class CustomBoxDecoration {
  static BoxDecoration build() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 8,
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }
}
