import 'package:apptacc/presentation/widgets/shop_row.dart';
import 'package:flutter/material.dart';

import '../../config/theme.dart';

class ListShops extends StatelessWidget {
  const ListShops({super.key});
  

  @override
  Widget build(BuildContext context) 
  {
    String? categoria = ModalRoute.of(context)?.settings.arguments.toString();

    print(categoria);

    return Scaffold(
      appBar: AppBar(
        title: Text('AppTacc'),
        backgroundColor: AppTheme.naranja,
      ),
      backgroundColor: AppTheme.fondo,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ShopRow();
        },
        itemCount: 10,
      ),
    );
  }
}
