import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/login.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        const SizedBox(
          height: 10,
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 4, vertical: -4),
          leading: Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.fitWidth,
          ),
          title: Text("Menu"),
        ),
        const Divider(
          height: 20,
          thickness: 0.2,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 4, vertical: -4),
          leading: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://scontent.fkhi2-3.fna.fbcdn.net/v/t39.30808-6/295854415_3148830022097963_3614660864564168800_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFTrxgtUzCI8CBdoTVjjk01Nh0WRNPb8pY2HRZE09vyllY0Q4P_gYMH5GT5JaGhm2tJENjahhepJy4vQOrSL9L7&_nc_ohc=vqY_ENQJ7scAX8gzz3s&_nc_ht=scontent.fkhi2-3.fna&oh=00_AT-U5RqZ-EHobpJ9YIZf7-oIygawqig234plBUDCHTfPgQ&oe=6301B971",
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
            ),
          ),
          title: Text("Muhammad Azhar"),
          subtitle: Text("see your profile"),
        ),
        const Divider(
          height: 20,
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
          height: 20,
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
          height: 20,
          thickness: 0.05,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
      ],
    );
  }
}
