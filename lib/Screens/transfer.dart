import 'package:flutter/material.dart';
import 'package:img_demo_app/View Model/SOH/soh_view_model.dart';
import 'package:img_demo_app/Model/SOH/stock_on_hand.dart';
import 'package:img_demo_app/Screens/SOH/soh_item.dart';
import 'package:img_demo_app/Utilities/constant.dart';

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  List<StockOnHand> allSOHList = List<StockOnHand>();

  void initState() {
    // TODO: implement initState
    super.initState();
    getSOHDetails();
  }

  void getSOHDetails() async{
    SOHViewModel  sohViewModel = SOHViewModel();
    try {
      final data = await sohViewModel.getSOHListData();
      setState(() {
        allSOHList = data.getProductListFromData();
      });
    } catch (error) {
      showAlertDialog(context,'Unable to fetch Data');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Text(
            'SOH', style:TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: allSOHList.length == 0 ? Text("No Records Found",style: kH3FontTextStyleGrey(),) : ListView.builder(
                  itemCount: allSOHList.length,
                  itemBuilder: (context, position) => SOHItem(allSOHList[position])
              ),
            ),
          ),
        ],
      ),

    );
  }
}
