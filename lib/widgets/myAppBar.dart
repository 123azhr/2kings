import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/Chat/chatMenu.dart';
import '../Screens/homepage/components/search.dart';
import '../helper/size_configuration.dart';

class ReusableWidgets {
IconButton chatIcon(context){
    return IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => chatMenu()),
            );
          },
          icon: const Icon(
            Icons.chat,
          ),
        );
  }
  static myAppBar(
    BuildContext context,
    String title,
    Widget? leading,
    IconData icon,
  ) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      leading: leading,
      title: Text(
        "$title",
        style: TextStyle(
          color: Colors.black,
          fontSize: (kToolbarHeight / 100) * 40,
        ),
      ),
      actions: [
        IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Search()),
            );
          },
          icon: const Icon(
            Icons.search,
          ),
        ),
      ],
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
