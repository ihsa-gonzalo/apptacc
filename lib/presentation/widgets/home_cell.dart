import 'package:apptacc/config/theme.dart';
import 'package:apptacc/model/home_menu_model.dart';
import 'package:flutter/material.dart';

class HomeCell extends StatelessWidget {
  final HomeMenuModel menu;

  const HomeCell({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () 
        {
          Navigator.pushNamed(context, "shops",arguments: menu.categoria);
        },
        child: Container(
        height: 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppTheme.naranja,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4, color: Color(0x33000000), offset: Offset(0, 2))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 15, top: 5),
                child: Expanded(
                  child: Icon(
                    menu.icono,
                    size: 50,
                  ),
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Text(menu.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: AppTheme.textSizeMedium,
                      fontFamily: 'Intro')),
            )
          ],
        ),
          ),
      ));
  }
}
