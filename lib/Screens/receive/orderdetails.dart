import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/Receive/order_object.dart';
import 'package:img_demo_app/Model/Receive/sto_object.dart';
import 'package:img_demo_app/Utilities/utilities.dart';
import 'package:img_demo_app/Screens/widget/search_bar.dart';
import 'package:img_demo_app/Utilities/constant.dart';
import 'package:img_demo_app/View Model/Receive/receive_view_model.dart';
import 'package:img_demo_app/Utilities/snack_bar_helper.dart';

class OrderDetails extends StatefulWidget {
  final OrderObject _orderObject;
  OrderDetails(this._orderObject);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();

}

class _OrderDetailsState extends State<OrderDetails> {
 int temp;
  FocusNode myFocusNode;
  TextEditingController editingController = TextEditingController();
  TextEditingController _receivedQTYTextController = TextEditingController();
  ReceiveViewModel receiveViewModel = ReceiveViewModel();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
    //_requiredQTYTextController.text =  widget._stoObject.quantity.toString();
  }

  void searchDataInArray(String searchString){
    print(searchString);
  }

  void updateReceiveOrderStatus() async{
    // TODO: update code for service response 
    final result = await receiveViewModel.updateReceiveOrderStatus(widget._orderObject.SKU_Details);
    print('updateReceiveOrderStatus response received');
    print(result);
    if (result == null) {
      showAlertDialog(context,'Unable to update receive data');
    } else {
      showAlertDialog(context,result);
    }
  }

  int getTotalCount (){
    num sum = 0;
    widget._orderObject.SKU_Details.forEach((STOObject e){sum += e.quantity;});
    return sum;
  }

 int getReceivedTotalCount (){
   num sum = 0;
   widget._orderObject.SKU_Details.forEach((STOObject e){sum += e.actualReceived;});
   return sum;
 }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return new Scaffold(
      key: _scaffoldkey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title:Text('STO No : ' + widget._orderObject.sto_number.toString(),
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
        ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Center(child: Text('Order Details (Receipt)',style: kH3FontTextStyleBlackBold())),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('From: V9876',style: kNormalFontTextStyleBlack(),),
                    Text('Total Items : ' + getTotalCount().toString(),style: kNormalFontTextStyleBlack())
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('To: S9876',style: kNormalFontTextStyleBlack()),
                    Text('Received Count : ' + getReceivedTotalCount().toString() ,style: kNormalFontTextStyleBlack())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,right: 0.0,left: 0.0,),
                child: SearchBar(hintText: 'Search by Item No',searchTextController: editingController, onTextChanged: (value){
                  searchDataInArray(value);
                },),
              ),
              Divider(
                height: 2.0,
                color: Colors.grey,
              ),
              Container(
                child: Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget._orderObject.SKU_Details.length,
                    itemBuilder: (context, index) {
                      var skuObject = widget._orderObject.SKU_Details[index];
                      return Container(
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                                  child: Text(
                                    skuObject.sku_description,
                                    style: TextStyle(
                                        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.orange),
                                  ),
                                ),
                               ]
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      'Required',
                                      style: TextStyle(fontSize: 13.0, color: Colors.grey,),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      'Received',
                                      style: TextStyle(fontSize: 13.0, color: Colors.grey,),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      'Unit',
                                      style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      'Status',
                                      // subjectList[position],
                                      style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      skuObject.quantity.toString(),
                                      // subjectList[position],
                                      style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              // if( widget.productData.qty != 0)
                                              GestureDetector(
                                                onTap:(){
                                                  if (skuObject.actualReceived > 0) {
                                                    setState(() {
                                                      skuObject.actualReceived--;
                                                    });
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
                                                  skuObject.actualReceived.toString(),style: kH3FontTextStyleBlackBold(),),
                                              ),
                                              // if(widget.productData.qty != 0)
                                              GestureDetector(
                                                onTap: (){
                                                  //model.addProduct();
                                                  setState(() {
                                                    skuObject.actualReceived++;
                                                  });
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
                                      )
                                  ),

                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                    child: Text(
                                      skuObject.unit_of_measure,
                                      // subjectList[position],
                                      style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                    ),
                                  ),
                                  //if(skuObject.actualReceived > 0)
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                      child: Icon(
                                        Icons.done,
                                        size: 25.0,
                                        color: Colors.green,
                                      ),
                                    ),
                                ],
                              ),
                              Divider(
                                height: 2.0,
                                color: Colors.grey,
                              )
                            ],
                          ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  //padding: EdgeInsets.all(15),
                  splashColor: Colors.orange,
                  onPressed: (){
                        print('Submit button pressed');
                        updateReceiveOrderStatus();
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
