import 'package:flutter/material.dart';
import 'package:img_demo_app/Model/Receive/sto_object.dart';
import 'package:img_demo_app/View Model/Receive/receive_view_model.dart';
import 'package:img_demo_app/Utilities/snack_bar_helper.dart';
import 'package:img_demo_app/Screens/receive/receive_item.dart';
import 'package:img_demo_app/Screens/widget/search_bar.dart';

class Receiving extends StatefulWidget {

  @override
  _ReceivingState createState() => _ReceivingState();
}

class _ReceivingState extends State<Receiving> {

  final TextEditingController _textController = TextEditingController();
  List<STOObject> allSTOList = List<STOObject>();
  List<STOObject> filteredSTOList = List<STOObject>();
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSTOtDetails();
  }


  void getSTOtDetails() async{
    ReceiveViewModel  receiveViewModel = ReceiveViewModel();
    //SnackBarHelper.showLoadingSnackBar(_scaffoldkey, 'Saving skill details...');
    final data = await receiveViewModel.getSTOListData();
    //SnackBarHelper.hideLoadingSnackBar(_scaffoldkey);
    setState(() {
      allSTOList = data.getSTOListFromData();
      filteredSTOList = allSTOList;
    });
  }

  void searchDataInArray(String searchString){
    print(searchString);
  }

  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
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
                child: ListView.builder(
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
