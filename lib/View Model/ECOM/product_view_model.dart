import 'dart:convert';
import 'dart:async';
import 'package:img_demo_app/Network Manager/network_manager.dart';
import 'package:img_demo_app/Model/product_list.dart';
import 'package:img_demo_app/Utilities/server_api_constant.dart';

class ProductViewModel {
  NetworkManager manager = NetworkManager();

  Future<ProductList> getProductListData() async {
    final response = await manager.invokeGetMethod(API_GET_PRODUCT);
    print(response);
    final data = ProductList.fromJson(response['data']['goods']);
    print(data);
    return data;
  }
}