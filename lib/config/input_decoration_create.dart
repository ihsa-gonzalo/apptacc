import 'package:flutter/material.dart';

class InputDecorationCreate {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2)),
      hintText: hintText,
      labelText: labelText,
      focusColor: Colors.black,
      labelStyle: const TextStyle(color: Colors.black),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: Colors.green,
            )
          : null,
    );
  }
}
