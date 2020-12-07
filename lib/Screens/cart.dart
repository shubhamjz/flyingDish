import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/product.dart';
import 'package:img_demo_app/View Model/ECOM/product_view_model.dart';
import 'package:img_demo_app/Screens/Cart/cart_item.dart';
import 'package:img_demo_app/Utilities/constant.dart';

class CartPage extends StatefulWidget {

  final List<Product> allProductList;
  CartPage(this.allProductList);
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  double getTotoalCost() {
    num sum = 0;
    widget.allProductList.forEach((Product e){sum += e.qty * double.parse(e.retail_price);});
    return sum;
  }

  void placedOrderOfCart() async{
    ProductViewModel  productViewModel = ProductViewModel();
    final data = await productViewModel.placedOrder(widget.allProductList);
    print(data);
    showAlertDialog(context,'STO Confirmation no is ' + data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Cart"),
          actions: <Widget>[
            FlatButton(
                child: Text(
                  "Clear",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => null,
            )
          ],
        ),
        body:
        Container(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: widget.allProductList.length == 0 ? Text("No Records Found") :ListView.builder(
                        itemCount:widget.allProductList.length,
                        itemBuilder: (context, index) => CartItem(widget.allProductList[index],(value){
                          setState(() {
                            widget.allProductList[index].qty = value;
                          });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$ " + getTotoalCost().toString(),
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    color: Colors.yellow[900],
                    textColor: Colors.white,
                    elevation: 0,
                    child: Text("Place Order"),
                    onPressed: () {
                      placedOrderOfCart();
                    },
                  )
                ],
              )
            ]
    )
    )
    );
  }
}