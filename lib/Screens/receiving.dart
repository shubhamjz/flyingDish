import 'package:flutter/material.dart';

class Receiving extends StatefulWidget {

  @override
  _ReceivingState createState() => _ReceivingState();
}

class _ReceivingState extends State<Receiving> {


  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
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
          Expanded(
            child: GestureDetector(
              onTap: () {
                // final snackBar = SnackBar(content: Text("Tap"));
                Navigator.pushNamed(context, '/orderdetails');
                // Scaffold.of(context).showSnackBar(snackBar);
              },
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, position) {
                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                                child: Text(
                                  'Sto No',
                                  style: TextStyle(
                                      fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.orange),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                                child: Text(
                                  'created date',
                                  // subjectList[position],
                                  style: TextStyle(fontSize: 10.0, color: Colors.grey,),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 25.0,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "status",
                                    style: TextStyle(color: Colors.grey, fontSize: 9.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 2.0,
                        color: Colors.grey,
                      )
                    ],
                  );
                },


              ),
            ),
          ),
        ],
      ),
    );
  }
}
