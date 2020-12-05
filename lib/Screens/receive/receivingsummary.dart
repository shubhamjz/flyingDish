import 'package:flutter/material.dart';

class ReceivingSummary extends StatefulWidget {
  @override
  _ReceivingSummaryState createState() => _ReceivingSummaryState();
}

class _ReceivingSummaryState extends State<ReceivingSummary> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title:Text('Receiving Summary',
            style: TextStyle(color: Colors.black, fontSize: 15.0),
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
            gradient:LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red, Colors.orange])
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Center(child: Icon(Icons.send,
                color:  Colors.white,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Center(child: Text('Total',
              style:TextStyle(
                color: Colors.white,
                fontSize: 12
              ),)),
            ),

            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Center(child: Text(' 1 Item',style:TextStyle(
                  color: Colors.white,
                  fontSize: 18
              ))),
            ),

            Padding(
              padding: const EdgeInsets.only(top:10.0,right: 30.0,left: 30.0),
              child: Center(child: Text('One item is going to be received from DC55 to STORE 403 with tracking #8417747649',style:TextStyle(
                  color: Colors.white,
                  fontSize: 12
              ))),
            ),

            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Center(child: Text('1 SKU under shipped(-1 Item).',style:TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ))),
            ),
          ],
        ),
      ),
    );
  }
}
