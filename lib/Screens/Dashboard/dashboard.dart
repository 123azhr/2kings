import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Chat/chat_menu.dart';
import 'package:housecontractors/Screens/menu/menu.dart';
import 'package:housecontractors/Screens/newsfeed/newsfeed.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../providers/current_user_provider.dart';
import '../../providers/worker_provider.dart';
import '../homepage/home.dart';
import '../orders/my_orders.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    loadWorkers();

    super.initState();
  }

  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ChatMenu(),
    Newsfeed(),
    const MyOrders(),
    const Menu(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  loadWorkers() async {
    CurrentUserProvider().dispose();
    try {
      final currentUserProvider =
          Provider.of<CurrentUserProvider>(context, listen: false);
      await currentUserProvider.fetch();
    } catch (e) {
      print("Current user not  found");
    }
    try {
      final workerProvider =
          Provider.of<WorkerProvider>(context, listen: false);
      await workerProvider.fetch();
    } catch (e) {
      print("no workers found");
    }
  }

  @override
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