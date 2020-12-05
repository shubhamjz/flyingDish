import 'package:img_demo_app/Model/Receive/sto_object.dart';
class STOList{
  List<STOObject> stoList;

  STOList({this.stoList});

  factory STOList.fromJson(List<dynamic> json) {
    List<STOObject> dataList = List<STOObject>();
    if(json != null) {
      dataList = json.map((e) => STOObject.fromJson(
          e as Map<String, dynamic>)).toList();
    }
    return STOList(stoList: dataList);
  }

  List<STOObject> getSTOListFromData(){
    List<STOObject> stoListArray = List<STOObject>();
    stoList.forEach((element) {
      stoListArray.add(element);
    });
    return stoListArray;
  }
}