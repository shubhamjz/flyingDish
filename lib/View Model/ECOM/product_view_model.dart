import 'dart:async';
import 'package:img_demo_app/Network Manager/network_manager.dart';
import 'package:img_demo_app/Model/product_list.dart';
import 'package:img_demo_app/Utilities/server_api_constant.dart';
import 'package:img_demo_app/Model/product.dart';
import 'dart:convert';

class ProductViewModel {
  NetworkManager manager = NetworkManager();

  Future<ProductList> getProductListData() async {
    final response = await manager.invokeGetMethod(API_GET_PRODUCT);
    print(response);
    final data = ProductList.fromJson(response['data']['goods']);
    print(data);
    return data;
  }

  Future<String> placedOrder(List<Product> products) async {

    var formatedData = getFormatedORderData(products);
    print(formatedData);
    final response = await manager.invokePostMethod(API_PLACED_ORDEFR,json.encode(
        formatedData
    ));
    print('placedOrder response received');
    print(response);
    print(response['data']);
    print(response['data']['stoConfirmationNumber']);
    return response['data']['stoConfirmationNumber'];
  }

  dynamic getFormatedORderData(List<Product> products){
    final data = [];
    for (Product element in products){
      Map<String, String> config =
      {
        'requestor_id': 'S9876',
         "supplier_id": "V9876",
        "sku_id": element.sku_id,
        "sku_description" : element.sku_description,
        "quantity": element.qty.toString(),
        "delivery_method": "Shipping",
        "unit_of_measure": element.unit_of_measure,
        "created_by": "David"
      };

      print(config);
      data.add(config);
    }
    print(data);
    return data;
  }

}