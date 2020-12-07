import 'package:flutter/material.dart';

class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child:  new Theme(
    data: new ThemeData(
    primaryColor: Colors.white,
    primaryColorDark: Colors.red,
    ),
    child:TextField(
        cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(

                  width: 10.0),
            ),
            enabledBorder:OutlineInputBorder(
              borderSide: BorderSide(
                    color: Colors.white,
                  width: 2.0),
            ),
            fillColor: Colors.white,
            labelText: 'User Name',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ),
      ),
    );
  }
}