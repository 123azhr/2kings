import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Chat/chat_menu.dart';
import 'package:housecontractors/Screens/menu/menu.dart';
import 'package:housecontractors/Screens/newsfeed/newsfeed.dart';
import '../../helper/size_configuration.dart';
import '../homepage/home.dart';
import '../orders/my_orders.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ChatMenu(),
    Newsfeed(),
    const MyOrders(),
    const Menu(title: "Azhar"),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: "Chats",
              icon: Icon(Icons.chat),
            ),
            BottomNavigationBarItem(
              label: "Newsfeed",
              icon: Icon(Icons.newspaper_outlined),
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