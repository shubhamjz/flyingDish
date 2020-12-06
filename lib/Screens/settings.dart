import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.indigo,
        elevation:0.0,
        title: Text(
          'settings', style:TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body:Container(
        child: Column(
          children: [
            
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
                        'About',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.grey),
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
                      
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Divider(
                height: 2.0,
                color: Colors.grey,
              ),
            ),
            GestureDetector(
              onTap:() {
                  Navigator.pushNamed(context, '/kitchenselection');
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                          child: Text(
                            'Kitchen',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Text("Kitchen 1")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:12.0),
              child: Divider(
                height: 2.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
