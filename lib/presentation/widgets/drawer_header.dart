import 'package:apptacc/config/theme.dart';
import 'package:flutter/material.dart';

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(color: AppTheme.naranja),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                child: Image.asset("assets/images/logo.png", width: 70,height: 100,),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: const Center(
                    child: Text(
                  "AppTacc",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )))
          ],
        )));
  }
}