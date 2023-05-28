import 'package:apptacc/presentation/screens/create_screen.dart';
import 'package:apptacc/presentation/screens/home_screen.dart';
import 'package:apptacc/presentation/screens/list_shops.dart';
import 'package:apptacc/presentation/screens/login_screen.dart';
import 'package:apptacc/presentation/screens/maps_screen.dart';
import 'package:apptacc/presentation/screens/onboarding_screen.dart';
import 'package:apptacc/presentation/screens/search_screen.dart';
import 'package:apptacc/presentation/screens/splash_screen.dart';
import 'package:apptacc/provider/create_form_provider.dart';
import 'package:apptacc/provider/login_provider.dart';
import 'package:apptacc/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SearchProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginFormProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CreateFormProvider(),
          )
        ],
        child: MaterialApp(
          initialRoute: "maps",
          routes: {
            "maps": (context) => const MapScreen(),
            "create": (context) => const CreateScreen(),
            "search": (context) => const SearchScreen(),
            "splash": (context) => const SplashScreen(),
            "onboarding": (context) => const OnBoardingScreen(),
            "home": (context) => const HomeScreen(),
            "login": (context) => const LoginScreen(),
            "shops": (context) => const ListShops(null),
          },
          theme: AppTheme().getTheme(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
