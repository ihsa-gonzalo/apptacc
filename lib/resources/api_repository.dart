import 'package:apptacc/model/shop_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<ShopModel>> fetchShopList() {
    return _provider.fetchShopList();
  }

  Future<List<ShopModel>> fetchLocalShopList() 
  {
    return _provider.fetchLocalShopList();
  }
}

class NetworkError extends Error {}