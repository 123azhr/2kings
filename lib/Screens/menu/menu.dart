import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/profile/edit_profile.dart';
import 'package:housecontractors/Screens/profile/profile_view.dart';

import '../../helper/size_configuration.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.title}) : super(key: key);
  final String title;
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
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileView(
                          title: title,
                        ))),
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfilePage(),
              ),
            ),
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
