import 'dart:ui';

import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

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
          title: const Text("Notifications"),
        ),
        const Divider(
          height: 20,
          thickness: 0.2,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        Column(
          children: [
            ListTile(
              leading: Image.network(
                "https://scontent.fkhi2-3.fna.fbcdn.net/v/t39.30808-6/295854415_3148830022097963_3614660864564168800_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFTrxgtUzCI8CBdoTVjjk01Nh0WRNPb8pY2HRZE09vyllY0Q4P_gYMH5GT5JaGhm2tJENjahhepJy4vQOrSL9L7&_nc_ohc=vqY_ENQJ7scAX8gzz3s&_nc_ht=scontent.fkhi2-3.fna&oh=00_AT-U5RqZ-EHobpJ9YIZf7-oIygawqig234plBUDCHTfPgQ&oe=6301B971",
                fit: BoxFit.contain,
              ),
              title: Text("XYZ has asked for your service."),
              trailing: PopupMenuButton(itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Remove this notification"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Turn off notification about this."),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("report"),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  print("Remove this notification menu is selected.");
                } else if (value == 1) {
                  print("Turn off notification about this. menu is selected.");
                } else if (value == 2) {
                  print("report menu is selected.");
                }
              }),
            ),
          ],
        ),
      ],
    );
  }
}
