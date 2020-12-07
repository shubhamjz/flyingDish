import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child:new Theme(
          data: new ThemeData(
            primaryColor: Colors.white,
            primaryColorDark: Colors.red,
          ),
          child:TextField(
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            obscureText: true,
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
              labelText: 'Password',
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

