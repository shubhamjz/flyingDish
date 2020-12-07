import 'package:img_demo_app/Model/Receive/sto_object.dart';
class OrderObject {
  int sto_number;
  List<STOObject> SKU_Details;
  OrderObject({this.sto_number,this.SKU_Details});

  OrderObject.fromJson(Map<String, dynamic> json) {
    sto_number = json['sto_number'];
    SKU_Details = new List<STOObject>();
    if (json['SKU_Details'] != null) {
      json['SKU_Details'].forEach((v) {
        SKU_Details.add(new STOObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sto_number'] = this.sto_number;
    data['SKU_Details'] = this.SKU_Details.map((v) => v.toJson()).toList();
  }

}

