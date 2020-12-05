import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showInSnackBar(GlobalKey<ScaffoldState> _scaffoldkey, String value, Color backgroundColor) {
    _scaffoldkey.currentState.showSnackBar(
        new SnackBar(
            backgroundColor: backgroundColor,
            content: Wrap(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value),
              ],
            )
          //content: new Text(value)
        )
    );
  }

  static void hideLoadingSnackBar(GlobalKey<ScaffoldState> _scaffoldkey) {
    _scaffoldkey.currentState.hideCurrentSnackBar();
  }

  static void showLoadingSnackBar(GlobalKey<ScaffoldState> _scaffoldkey, String message) {
    _scaffoldkey.currentState
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          duration: Duration(minutes: 2),
          backgroundColor: Colors.blue,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(message),
              CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          )));
  }
}
