import 'package:img_demo_app/Model/Receive/order_object.dart';
class STOList{
  List<OrderObject> stoList;

  STOList({this.stoList});

  factory STOList.fromJson(List<dynamic> json) {
    List<OrderObject> dataList = List<OrderObject>();
    if(json != null) {
      dataList = json.map((e) => OrderObject.fromJson(
          e as Map<String, dynamic>)).toList();
    }
    return STOList(stoList: dataList);
  }

  List<OrderObject> getSTOListFromData(){
    List<OrderObject> stoListArray = List<OrderObject>();
    stoList.forEach((element) {
      stoListArray.add(element);
    });
    return stoListArray;
  }
}