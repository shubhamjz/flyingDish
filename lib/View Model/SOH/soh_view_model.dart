import 'dart:async';
import 'package:img_demo_app/Network Manager/network_manager.dart';
import 'package:img_demo_app/Model/SOH/soh_list.dart';
import 'package:img_demo_app/Utilities/server_api_constant.dart';
import 'package:img_demo_app/Model/product.dart';
import 'dart:convert';

class SOHViewModel {
  NetworkManager manager = NetworkManager();

  Future<SOHList> getSOHListData() async {
    final response = await manager.invokeGetMethod(API_GET_SOH_LIST);
    if(response['status'] == 'Success'){
      final data = SOHList.fromJson(response['data']);
      print(data);
      return data;
    }else {
        throw(response['Failure']);
    }
  }
}