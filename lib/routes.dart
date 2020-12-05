import 'package:flutter/material.dart';
import './Screens/login.dart';
import './Screens/home.dart';
import './Screens/kitchenselection.dart';
import './Screens/receive/orderdetails.dart';
import './Screens/receive/orderskudetails.dart';
import './Screens/receive/receivingsummary.dart';
import './Screens/settings.dart';
class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>Login(),
        '/home':(context)=>Home(),
        '/kitchenselection':(context)=>KitchenSelection(),
        '/orderskudetails':(context)=>OrderSkuDetails(),
        '/receivingsummary':(context)=>ReceivingSummary(),
        '/settings':(context)=>Settings(),
       // '/login':(context)=>Login(),

      },
    );
  }
}
