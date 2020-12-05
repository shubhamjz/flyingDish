import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/product.dart';

class ProductItem extends StatefulWidget {
  @override
  _ProductItemState createState() => _ProductItemState();
  final Product productData;
  ProductItem(this.productData);
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                      bottom: 0.0),
                  child: Text(
                    widget.productData.sku_description,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: 5.0,
                    top: 5.0,
                    bottom: 0.0),
                child: Icon(Icons.favorite,
                  color: Colors.black12,
                  size: 20,
                ),
              ),
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      left: 16.0,
                      right: 200.0,
                      top: 0.0,
                      bottom: 0.0),
                  child: Text(widget.productData.unit_of_measure)),
              ////

              if( widget.productData.qty != 0)
                new IconButton(
                  icon: new Icon(Icons.remove),
                  onPressed: () {
                    if (widget.productData.qty > 0) {
                      widget.productData.qty--;
                    }
                    //model.addProduct(_products[index]);
                    // model.removProduct(
                    //     _products[index]);
                    // //model.updateProduct(_products[index],
                    //     _products[index].qty);

                  },
                ),
              if(widget.productData.qty != 0)
                new Text(
                    widget.productData.qty.toString()),
              if(widget.productData.qty != 0)
                new IconButton(
                    icon: new Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        widget.productData.qty++;
                      });

                    }),
              // _products[index].qty ==0? new IconButton(icon: new Icon(Icons.add) ):new Container(),
              if(widget.productData.qty == 0)
                ButtonTheme(
                  //minWidth: 60.0,
                  height: 25.0,
                  child: RaisedButton(
                    color: Colors.orangeAccent,
                    onPressed: () {
                      if (widget.productData.qty > 0){
                      setState(() {
                        widget.productData.qty--;
                      });}

                      // model.addProduct(
                      //     _products[index]);
                      // //model.updateProduct(_products[index],
                      //     _products[index].qty);
                      //print(count);
                    },
                    child: Text('Add',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              /////
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 20),
                  child: Text("\$" +
                      widget.productData.retail_price.toString())),
              Padding(
                padding: const EdgeInsets.only(left: 150),
                child: Row(

                  children: <Widget>[

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}