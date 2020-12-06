import 'package:flutter/material.dart';


const kTextColorGrey = Color(0xFFBBBBBB);
const kTextColorBlack = Color(0xFF2E2E2E);

TextStyle kNormalFontTextStyleGrey() {
  return TextStyle(
    color: kTextColorGrey,
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}

TextStyle kH3FontTextStyleGrey() {
  return TextStyle(
    color: kTextColorGrey,
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}

TextStyle kNormalFontTextStyleBlack() {
  return TextStyle(
    color: kTextColorBlack,
    fontFamily: 'Montserrat',
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}


TextStyle kH3FontTextStyleBlackBold() {
  return TextStyle(
    color: kTextColorBlack,
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

TextStyle kH3FontTextStyleGreyBold() {
  return TextStyle(
    color: kTextColorGrey,
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}

showAlertDialog(BuildContext context, String message) {

  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Flying Dish"),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
