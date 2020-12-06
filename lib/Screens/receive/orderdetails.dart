import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/Receive/sto_object.dart';
import 'package:img_demo_app/Utilities/utilities.dart';
import 'package:img_demo_app/Screens/widget/search_bar.dart';
import 'package:img_demo_app/Utilities/constant.dart';
import 'package:img_demo_app/View Model/Receive/receive_view_model.dart';
import 'package:img_demo_app/Utilities/snack_bar_helper.dart';

class OrderDetails extends StatefulWidget {
  final STOObject _stoObject;
  OrderDetails(this._stoObject);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();

}

class _OrderDetailsState extends State<OrderDetails> {
 int temp;
  FocusNode myFocusNode;
  TextEditingController editingController = TextEditingController();
  TextEditingController Qty = TextEditingController();
  final duplicateItems = List<String>.generate(10, (i) => "TRK1Z0MY89202005161 $i");
  var items = List<String>();
  TextEditingController _requiredQTYTextController = TextEditingController();
  TextEditingController _receivedQTYTextController = TextEditingController();
  ReceiveViewModel receiveViewModel = ReceiveViewModel();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    items.addAll(duplicateItems);
    myFocusNode = FocusNode();
    super.initState();
    _requiredQTYTextController.text =  widget._stoObject.quantity.toString();
  }

  void searchDataInArray(String searchString){
    print(searchString);
  }

  void updateReceiveOrderStatus() async{
    // TODO: update code for service response 
    final result = await receiveViewModel.updateReceiveOrderStatus(widget._stoObject.unique_id, widget._stoObject.quantity);
    print('updateReceiveOrderStatus response received');
    print(result);
    if (result == null) {
      showAlertDialog(context,'Unable to update receive data');
    } else {
      showAlertDialog(context,result);
    }
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
          title:Text('STO No : ' + widget._stoObject.sto_number.toString(),
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
        ),
      body: SingleChildScrollView(
        child: Container(
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
                      Text('From: ' + widget._stoObject.supplier_id,style: kNormalFontTextStyleBlack(),),
                      Text('Total Items : ' + widget._stoObject.quantity.toString(),style: kNormalFontTextStyleBlack())
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('To: ' + widget._stoObject.requestor_id,style: kNormalFontTextStyleBlack()),
                      Text('Created : ' + formatDateFromString(widget._stoObject.created_date),style: kNormalFontTextStyleBlack())
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
                  height: 370,
                  child: Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                                    child: Text(
                                      widget._stoObject.sku_id,
                                      style: TextStyle(
                                          fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.orange),
                                    ),
                                  ),
                                 ]
                                ),
                                Row(
                                  children: [
                                    Column(
                                      //crossAxisAlignment : CrossAxisAlignment.start,
                                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
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
                                            widget._stoObject.quantity.toString(),
                                            // subjectList[position],
                                            style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
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
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                //borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              width:width/4,
                                              height:height/16,
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: TextField(
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical: TextAlignVertical.center,
                                                    controller : _receivedQTYTextController,
                                                    decoration: InputDecoration(
                                                      fillColor: Colors.orange,
                                                      border: InputBorder.none,
                                                    ),
                                                  onChanged: (value){

                                                  },
                                                ),
                                              ),
                                            )
                                        ),
                                      ],
                                    ),
                                    Column(
                                     children: [
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
                                           widget._stoObject.unit_of_measure,
                                           // subjectList[position],
                                           style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                         ),
                                       ),
                                     ],
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                          child: Text(
                                            'Status',
                                            // subjectList[position],
                                            style: TextStyle(fontSize: 14.0, color: Colors.grey,),
                                          ),
                                        ),
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
      ),
    );
  }
}
