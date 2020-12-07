import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/Receive/order_object.dart';
import 'package:img_demo_app/View Model/Receive/receive_view_model.dart';
import 'package:img_demo_app/Screens/receive/receive_item.dart';
import 'package:img_demo_app/Screens/widget/search_bar.dart';
import 'package:img_demo_app/Utilities/constant.dart';

class Receiving extends StatefulWidget {

  @override
  _ReceivingState createState() => _ReceivingState();
}

class _ReceivingState extends State<Receiving> {

  final TextEditingController _textController = TextEditingController();
  List<OrderObject> allSTOList = List<OrderObject>();
  List<OrderObject> filteredSTOList = List<OrderObject>();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSTOtDetails();
  }


  void getSTOtDetails() async{
    ReceiveViewModel  receiveViewModel = ReceiveViewModel();
    try {
      final data = await receiveViewModel.getSTOListData();
      setState(() {
        allSTOList = data.getSTOListFromData();
        filteredSTOList = allSTOList;
      });
    } catch (error) {
      showAlertDialog(context,'Unable to fetch Data');
    }

  }

  void searchDataInArray(String searchString){
    print(searchString);
  }

  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Receive',
          style: TextStyle(color: Colors.black, fontSize: 15.0),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            child: SearchBar(hintText: 'Search by STO No',searchTextController: _textController, onTextChanged: (value){
              searchDataInArray(value);
            },),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: filteredSTOList.length == 0 ? Text("No Records Found") : ListView.builder(
                  itemCount: filteredSTOList.length,
                    itemBuilder: (context, position) => ReceiveItem(filteredSTOList[position])
                ),
              ),
          ),
        ],
      ),
    );
  }
}
