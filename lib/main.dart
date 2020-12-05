import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:splashscreen/splashscreen.dart';

// void main() {
//   runApp(Routes());
// }

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.red, Colors.orange]),
        ),
        child: SplashScreen(
          seconds: 2,
          gradientBackground:LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.red, Colors.orange]) ,
          navigateAfterSeconds: new Routes(),
          title: new Text(
            'Welcome To Img',
            style: new TextStyle(fontWeight: FontWeight.bold,  color: Colors.white, fontSize: 20.0),
          ),
          image: new Image.asset(
              'assets/logo&icons/splash.png'),
          photoSize: 150.0,
          //backgroundColor: Colors.white,
          loaderColor: Colors.white,
        ),
      )
    );


     SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new Routes(),
      title: new Text(
        'Welcome To Img',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png'),
      photoSize: 150.0,
      //backgroundColor: Colors.white,
      //loaderColor: Colors.red,
    );
  }
}




