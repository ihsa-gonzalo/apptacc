import 'dart:convert';

import 'package:apptacc/model/shop_model.dart';
import 'package:dio/dio.dart';

import '../data/local_shops.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://apptacc-api.onrender.com/comercios/?filtradoPor=cc&filtro=Restaurante&lat=-37.99046981482626&long=-57.558342038624005&radio=50';

  ApiProvider()    
  {
    _dio.options.connectTimeout = 10000;
  }

  Future<List<ShopModel>> fetchShopList() async 
  {
    Response response = await _dio.get(_url);
    List<ShopModel> shops =
        List<ShopModel>.from(response.data.map((x) => ShopModel.fromJson(x)));

    return shops;
  }

  Future<List<ShopModel>> fetchLocalShopList() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<ShopModel> shops =
        localShops.map((shop) => ShopModel.fromJson(shop)).toList();

    return shops;
  }
}
