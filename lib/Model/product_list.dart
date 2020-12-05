import 'package:img_demo_app/Model/product.dart';

class ProductList{
  List<Product> productList;

  ProductList({this.productList});

  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> dataList = List<Product>();
    if(json != null) {
      dataList = json.map((e) => Product.fromJson(
          e as Map<String, dynamic>)).toList();
    }
    return ProductList(productList: dataList);
  }

  List<Product> getJobListFromData(){
    List<Product> productListArray = List<Product>();
    productList.forEach((element) {
      productListArray.add(element);
    });
    return productListArray;
  }
}