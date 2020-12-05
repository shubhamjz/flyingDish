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
  final List<Widget> _pages = [Dashboard(), Com(), Transfer(), Receiving(),More()];
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Home"),
        //   automaticallyImplyLeading: false,
        // ),
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
              icon: Icon(Icons.home),
              title: Text("Com"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text("Transfer"),
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
