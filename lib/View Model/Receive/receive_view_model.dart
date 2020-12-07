import 'dart:async';
import 'dart:convert';
import 'package:img_demo_app/Network Manager/network_manager.dart';
import 'package:img_demo_app/Model/Receive/sto_list.dart';
import 'package:img_demo_app/Model/Receive/sto_object.dart';
import 'package:img_demo_app/Utilities/server_api_constant.dart';

class ReceiveViewModel{
  NetworkManager manager = NetworkManager();

  Future<STOList> getSTOListData() async {
    final response = await manager.invokePostMethod(API_STO_PRODUCTLIST,json.encode(
        {
          'status': 'Fullfilled',
        }
    ));
    if(response['status'] == 'Success') {
      final data = STOList.fromJson(response['data']['orders']);
      return data;
    } else {
      throw (response['errorCode']);
    }

  }

  Future<String> updateReceiveOrderStatus(List<STOObject> stoObjects) async {

    var formatedData = getFormatedReceivedData(stoObjects);

    final response = await manager.invokePostMethod(API_UPDATE_RECEIVEDSTATUS,json.encode(
        formatedData
    ));
    print('updateReceiveOrderStatus response received');
    if(response['status'] == 'Failure') {
      print('Fail');
      return response['errorCode'];
    } else {
      print('Success');
      return 'Order updated';
    }

  }

  dynamic getFormatedReceivedData(List<STOObject> STOObjects){
    final data = [];
    for (STOObject element in STOObjects){
      Map<String, dynamic> config =
      {
        'unique_id': element.unique_id,
        "status": "Received",
        "received_quantity": element.actualReceived,
      };
      data.add(config);
    }
    print(data);
    return data;
  }
}