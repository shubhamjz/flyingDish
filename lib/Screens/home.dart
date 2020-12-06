import 'package:flutter/material.dart';
import 'more.dart';
import 'dashboard.dart';
import 'transfer.dart';
import 'receiving.dart';
import 'com.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final List<Widget> _pages = [Dashboard(), Transfer(), Com(),  Receiving(),More()];
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
         appBar: PreferredSize(
           preferredSize: Size.fromHeight(5.0),
           child: new AppBar(
             backgroundColor: Colors.indigo,
            automaticallyImplyLeading: false,
             elevation: 0.0,
           ),
         ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey[500],
          currentIndex: _currentPage,
          onTap: (i) {
            setState(() {
              _currentPage = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Dashboard"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("SOH"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart_rounded),
              title: Text("Place Order"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text("Receiving"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text("more"),
            ),
          ],
        ),
        body: SafeArea(
          child: _pages[_currentPage],
        ),
      ),
    );
  }
}
