import 'package:apptacc/model/shop_model.dart';
import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ShopRow extends StatelessWidget {
  final ShopModel shopModel;
  void Function()? onTapFav;

  ShopRow(this.shopModel, {super.key, required this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Expanded(
          child: Container(
        height: 120,
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
              padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 0, top: 0, left: 10),
                child: Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      shopModel.imagenURL!,
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
                  ),
                )),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(shopModel.nombre!,
                       overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppTheme.textSizeMedium,
                              fontFamily: 'Intro')),
                    ),
                    Flexible(
                      child: Text(shopModel.direccion!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: AppTheme.textSizeMedium,
                              fontFamily: 'Intro')),
                    ),
                    Text(shopModel.categorias.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: AppTheme.textSizeMedium,
                            fontFamily: 'Intro'))
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onTapFav,
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(shopModel.isFavourite! == true ? Icons.favorite : Icons.favorite_border_outlined)
              ),
            )
          
          ],
        ),
      )),
    );
  }
}
