import 'package:apptacc/presentation/screens/home_screen.dart';
import 'package:apptacc/presentation/screens/list_shops.dart';
import 'package:apptacc/presentation/widgets/shop_row.dart';
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
        "/": (context) => HomeScreen(),
        "shops": (context) => ListShops(),
      },
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
