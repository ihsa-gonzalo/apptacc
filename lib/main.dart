import 'package:apptacc/presentation/screens/home_screen.dart';
import 'package:apptacc/presentation/screens/list_shops.dart';
import 'package:apptacc/presentation/screens/onboarding_screen.dart';
import 'package:apptacc/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'config/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "onboarding": (context) => const OnBoardingScreen(),
        "home": (context) => const HomeScreen(),
        "shops": (context) => const ListShops(),
      },
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
