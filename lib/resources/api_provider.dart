import 'dart:convert';

import 'package:apptacc/model/shop_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://apptacc-api.onrender.com/comercios/?filtradoPor=cc&filtro=Restaurante&lat=-37.99046981482626&long=-57.558342038624005&radio=50';

  Future<List<ShopModel>> fetchShopList() async
   {
      Response response = await _dio.get(_url);
      final jsonData = json.decode(response.data);

      List<ShopModel> shops = List<ShopModel>.from(jsonData.map((x) => ShopModel.fromJson(x)));

      return shops;

      
    
  }
}