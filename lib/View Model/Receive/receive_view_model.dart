import 'dart:async';
import 'dart:convert';
import 'package:img_demo_app/Network Manager/network_manager.dart';
import 'package:img_demo_app/Model/Receive/sto_list.dart';
import 'package:img_demo_app/Utilities/server_api_constant.dart';

class ReceiveViewModel{
  NetworkManager manager = NetworkManager();

  Future<STOList> getSTOListData() async {
    final response = await manager.invokePostMethod(API_STO_PRODUCTLIST,json.encode(
        {
          'status': 'Fullfilled',
        }
    ));
    print(response);
    final data = STOList.fromJson(response['data']);
    print(data);
    return data;
  }

  Future<String> updateReceiveOrderStatus(int uniqueId, int quantity) async {

    final response = await manager.invokePostMethod(API_UPDATE_RECEIVEDSTATUS,json.encode(
        {
          'unique_id' : uniqueId,
          'status': 'Received',
          'received_quantity' : quantity,
        }
    ));
    print('updateReceiveOrderStatus response received');
    print(response);
    print(response['data']);
    return response['data'];
  }
}