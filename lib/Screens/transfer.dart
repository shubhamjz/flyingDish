import 'package:flutter/material.dart';
class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
            'Transfer', style:TextStyle(
          color: Colors.black,
        ),
        ),
      ),
    );
  }
}
