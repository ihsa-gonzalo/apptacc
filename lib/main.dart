import 'package:apptacc/presentation/screens/home_screen.dart';
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
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('AppTacc'),backgroundColor: AppTheme.naranja,),
        backgroundColor: AppTheme.fondo,
        body: const HomeScreen()
      ),
    );
  }
}
