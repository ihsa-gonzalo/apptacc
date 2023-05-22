import 'package:apptacc/config/theme.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _purpleBackground(),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

BoxDecoration _purpleBackground() => const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(246, 140, 2, 1),
          Color.fromRGBO(245, 177, 87, 1)
        ],
      ),
    );

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Image.asset(
          "assets/images/logo.png",
          height: 150,
        ),
      ),
    );
  }
}
