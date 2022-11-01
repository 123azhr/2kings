import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';
import 'package:housecontractors/Screens/profile/edit_profile.dart';
import 'package:housecontractors/models/current_user.dart';
import 'package:housecontractors/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

import '../../helper/size_configuration.dart';
import '../../providers/user_provider.dart';
import '../profile/my_profile_view.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final loggedInUser =
        userProvider.getUserByID(FirebaseAuth.instance.currentUser!.uid);
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
                    loggedInUser.profileImageURL!,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              title: Text(
                loggedInUser.name!,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              subtitle: Text("View profile"),
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyProfileView(
                          title: loggedInUser.name!,
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
            title: Text(
              "Edit Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),InkWell(
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
            ),
          ),
          const Divider(
            thickness: 0.05,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
            height: 0,
          ),InkWell(
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
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
              title: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                context.read<AuthenticationService>().signOut();
              },
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
