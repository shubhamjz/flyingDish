import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/product.dart';
import'package:img_demo_app/View Model/ECOM/cart_view_model.dart';
import 'package:img_demo_app/Utilities/constant.dart';

class CartItem extends StatefulWidget {


  @override
  _CartItemState createState() => _CartItemState();
  final Product productData;
  final Function(int) onItemChanged;
  CartItem(this.productData,this.onItemChanged);

}

class _CartItemState extends State<CartItem> {

  CartModel model = CartModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child:  Text(
                    widget.productData.sku_description,
                    overflow: TextOverflow.ellipsis,
                    style: kH3FontTextStyleBlackBold(),
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child:  Text(
                    widget.productData.qty.toString() + ' * \$' + widget.productData.retail_price + ' = \$' + (widget.productData.qty * double.parse(widget.productData.retail_price)).toString(),
                    overflow: TextOverflow.ellipsis,
                    style: kH3FontTextStyleGrey(),
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20,top: 20,right: 50,bottom: 20),
                child: Row(
                  children: [
                    // if( widget.productData.qty != 0)
                    GestureDetector(
                      onTap:(){
                        if (widget.productData.qty > 0) {
                          setState(() {
                            widget.productData.qty--;
                          });
                          widget.onItemChanged(widget.productData.qty);
                        }
                        // print(widget.productData.sku_description);
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    ),
                    // if(widget.productData.qty != 0)
                    Padding(
                      padding: const EdgeInsets.only(left:10,right:10),
                      child: new Text(
                        widget.productData.qty.toString(),style: kH3FontTextStyleBlackBold(),),
                    ),
                    // if(widget.productData.qty != 0)
                    GestureDetector(
                      onTap: (){
                        //model.addProduct();
                        setState(() {
                          widget.productData.qty++;
                        });
                        widget.onItemChanged(widget.productData.qty);
                      },
                      child: Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}