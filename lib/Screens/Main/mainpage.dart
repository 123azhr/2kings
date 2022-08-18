import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/menu/menu.dart';
import 'package:housecontractors/Screens/newsfeed/newsfeed.dart';
import 'package:housecontractors/Screens/notifications/notifications.dart';
import 'package:housecontractors/Screens/orders/orders.dart';

import '../homepage/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Notifications(),
    Newsfeed(),
    Orders(),
    Menu(),
  ];
  @override
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: "Notifications",
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: "Newsfeed",
              icon: Icon(Icons.timeline),
            ),
            BottomNavigationBarItem(
              label: "Orders",
              icon: Icon(Icons.bookmark_add),
            ),
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(Icons.menu),
            )
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          elevation: 5,
        ),
      ),
    );
  }
}
/*
      color: Theme.of(context).colorScheme.background,
      child: Image.asset('assets/images/logo-black-full.png',
          fit: BoxFit.scaleDown),
          */