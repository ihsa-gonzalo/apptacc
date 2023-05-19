import 'package:apptacc/model/shop_model.dart';
import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ShopRow extends StatelessWidget {
  final ShopModel shopModel;

  const ShopRow(this.shopModel, {super.key});

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
                  child: Image.network(
                    shopModel.URL!,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(shopModel.nombre!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppTheme.textSizeMedium,
                          fontFamily: 'Intro')),
                  Text(shopModel.direccion!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: AppTheme.textSizeMedium,
                          fontFamily: 'Intro')),
                  Text(shopModel.categorias.toString(),
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
