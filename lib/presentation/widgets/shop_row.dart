import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ShopRow extends StatelessWidget {
  const ShopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
          child: Container(
        height: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppTheme.naranja,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 4, color: Color(0x33000000), offset: Offset(0, 2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 0, top: 0, left: 10),
                child: Expanded(
                  child: Icon(
                    Icons.abc,
                    size: 50,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Categoria",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppTheme.textSizeMedium,
                          fontFamily: 'Intro')),
                  Text("Direccion",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppTheme.textSizeMedium,
                          fontFamily: 'Intro')),
                  Text("aaaa",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppTheme.textSizeMedium,
                          fontFamily: 'Intro'))
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
