import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:apptacc/config/theme.dart';
import 'package:apptacc/presentation/screens/home_screen.dart';
import 'package:apptacc/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return FlutterSplashScreen.scale(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.light_naranja,
              AppTheme.naranja,
            ],
          ),
          childWidget: SizedBox(
            height: 200,
            child: Image.asset("assets/images/logo.png"),
          ),
          duration: const Duration(milliseconds: 1500),
          animationDuration: const Duration(milliseconds: 1000),
          onAnimationEnd: () => debugPrint("On Scale End"),
          defaultNextScreen: const OnBoardingScreen(),
        );
  }
}