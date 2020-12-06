import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
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
        //       (context, rebuildOnChange: true)
        //     .cart
        //     .length ==
        //     0
        //     ? Center(
        //   child: Text("No items in Cart"),
        // )
         //   :
        Container(
            padding: EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount:3,
                        itemBuilder: (context, index) {
                          return ListTile(
                                title: Text('sku des'),
                                subtitle: Text('qty' +
                                    " x " +
                                    'price' +
                                    " = " + 'total'),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right:10),
                                        child: GestureDetector(
                                          onTap: (){
                                          },
                                          child: Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 15.0,
                                              // onPressed: () {
                                              //   setState(() {
                                              //     widget.productData.qty++;
                                              //   });
                                              //
                                              // }),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // IconButton(
                                      //   icon: Icon(Icons.add,color: Colors.orangeAccent,),
                                      //   onPressed: () {
                                      //   },
                                      // ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: GestureDetector(
                                          onTap: (){

                                          },
                                          child: Container(
                                            width: 20.0,
                                            height: 20.0,
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15.0,
                                              // onPressed: () {
                                              //   setState(() {
                                              //     widget.productData.qty++;
                                              //   });
                                              //
                                              // }),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                    ]),

                              );

                            },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total: \$ 20",
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  RaisedButton(
                    color: Colors.yellow[900],
                    textColor: Colors.white,
                    elevation: 0,
                    child: Text("Place Order"),
                    onPressed: () {

                    },
                  )
                ],
              )
              // Container(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text(
              //       "Total: \$ ",
              //       style: TextStyle(
              //           fontSize: 24.0, fontWeight: FontWeight.bold),
              //     )),
              // SizedBox(
              //     width: double.infinity,
              //     child: RaisedButton(
              //       color: Colors.yellow[900],
              //       textColor: Colors.white,
              //       elevation: 0,
              //       child: Text("BUY NOW"),
              //       onPressed: () {
              //
              //       },
              //     ))
            ]
    )
    )
    );
  }
}
