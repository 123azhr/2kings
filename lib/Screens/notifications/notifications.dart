import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.fitWidth,
        ),
        title: Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return NotificationTile();
          }),
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Areeb Uz Zaman"),
      subtitle: Text("Lorem Ipsum check Lorem ipsum check"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ),
      ),
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
    );
  }
}
