import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
          title: Text(
            'Dashboard',
            style: TextStyle(color: Colors.white, fontSize: 15.0),
          ),
        ),
        body: new SingleChildScrollView(
            child:new Column(
                children: [
           new SizedBox(
             width: width,
             height: height/5,
             child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(
                     begin: Alignment.topRight,
                     end: Alignment.bottomLeft,
                     colors : [Colors.red, Colors.orange]
                 ),
                // borderRadius: BorderRadius.circular(10),
               ),
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: new Text('Hi FCT',
                     style: TextStyle(
                       color: Colors.white,
                       fontSize:18.0
                     ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: new Text('Here are your message for today!',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize:18.0
                       ),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: new Text('Last Updated 12 minutes ago',
                       style: TextStyle(
                           color: Colors.white,
                           fontSize:12.0
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),

                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:0.0 , top: 20),
                            child: Text(
                              'Return Item.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text(
                              'This Is notification',
                              style: TextStyle(

                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:0.0 , top:10),
                            child: Text(
                              'Return Item.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:10.0),
                            child: Text(
                              'This Is notification',
                              style: TextStyle(

                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider()
        ])));
  }
}
