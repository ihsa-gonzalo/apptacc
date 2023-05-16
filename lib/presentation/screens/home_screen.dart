import 'package:apptacc/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../config/home_menu.dart';
import '../widgets/home_cell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppTacc'),
        backgroundColor: AppTheme.naranja,
      ),
      backgroundColor: AppTheme.fondo,
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeCell(menu: HomeMenu.list[0]),
                  HomeCell(menu: HomeMenu.list[1])
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeCell(menu: HomeMenu.list[2]),
                  HomeCell(menu: HomeMenu.list[3])
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
