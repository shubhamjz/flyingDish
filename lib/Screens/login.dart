import 'package:flutter/material.dart';
import './widget/button.dart';
import './widget/first.dart';
import './widget/forgot.dart';
import './widget/inputEmail.dart';
import './widget/password.dart';
import './widget/textLogin.dart';
import './widget/verticalText.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.redAccent, Colors.orangeAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                 // VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(),
               // FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
