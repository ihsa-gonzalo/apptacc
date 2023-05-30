import 'package:apptacc/config/utils.dart';
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

  Future<List<ShopModel>> fetchSearchLocalShopList(String name) 
  async 
  {
    List<ShopModel> allShops =  await _provider.fetchLocalShopList();
    List<ShopModel> filterShops = [];
    for (ShopModel shopModel in allShops)
    {
      if (Utils.removeDiacritics(shopModel.nombre!).toLowerCase().contains(Utils.removeDiacritics(name.toLowerCase())))
      {
          filterShops.add(shopModel);
      }
    }
    return filterShops;
  }
}

class NetworkError extends Error {}