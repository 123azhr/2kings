import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/profile/profileView.dart';

import '../../helper/size_configuration.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.fitWidth,
        ),
        title: Text(
          "Menu",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          InkWell(
            child: ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              title: Text("Muhammad Azhar"),
              subtitle: Text("see your profile"),
            ),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfileView())),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            visualDensity: VisualDensity(horizontal: 4, vertical: -4),
            leading: CircleAvatar(
              child: Icon(Icons.edit_rounded),
            ),
            title: Text("Edit Profile"),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: ListTile(
              visualDensity: VisualDensity(horizontal: 4, vertical: -4),
              leading: CircleAvatar(
                child: Icon(Icons.logout),
              ),
              title: Text("Logout"),
            ),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
