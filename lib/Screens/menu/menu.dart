import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/profile/edit_profile.dart';
import 'package:housecontractors/Screens/profile/profile_view.dart';

import '../../helper/size_configuration.dart';
import '../profile/my_profile_view.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenWidth(40),
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.contain,
        ),
        title: Text(
          "Menu",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          InkWell(
            child: ListTile(
              visualDensity: VisualDensity(vertical: 4),
              dense: true,
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
                    builder: (context) => MyProfileView(
                          title: title,
                        ))),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),
          ListTile(
            visualDensity: VisualDensity(vertical: 4),
            dense: true,
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
            height: 0,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: ListTile(
              visualDensity: VisualDensity(vertical: 4),
              dense: true,
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
            height: 0,
          ),
        ],
      ),
    );
  }
}
