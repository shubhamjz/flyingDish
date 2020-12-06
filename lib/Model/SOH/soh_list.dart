import 'package:img_demo_app/Model/SOH/stock_on_hand.dart';

class SOHList{
  List<StockOnHand> sohList;

  SOHList({this.sohList});

  factory SOHList.fromJson(List<dynamic> json) {
    List<StockOnHand> dataList = List<StockOnHand>();
    if(json != null) {
      dataList = json.map((e) => StockOnHand.fromJson(
          e as Map<String, dynamic>)).toList();
    }
    return SOHList(sohList: dataList);
  }

  List<StockOnHand> getProductListFromData(){
    List<StockOnHand> sohListArray = List<StockOnHand>();
    sohList.forEach((element) {
      sohListArray.add(element);
    });
    return sohListArray;
  }
}