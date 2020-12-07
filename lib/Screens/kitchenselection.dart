import 'package:flutter/material.dart';

class KitchenSelection extends StatefulWidget {
  @override
  _KitchenSelectionState createState() => _KitchenSelectionState();
}

class _KitchenSelectionState extends State<KitchenSelection> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
        appBar: new AppBar(
          backgroundColor:Colors.indigo,
          automaticallyImplyLeading: false, //No more green
         // elevation: 0.0, //Shadow gone
          title: new Text(
            'Select Kitchen !',
            style: new TextStyle(color: Colors.white),
          ),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: [
              Row(
                children: [
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 1',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 2',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 3',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 4',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 5',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 6',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 7',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 8',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 9',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                  new SizedBox(
                    height: height / 5,
                    width: width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text('Kitchen 10',
                              style: TextStyle(color: Colors.orange,fontSize:18,fontWeight:FontWeight.bold)),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
