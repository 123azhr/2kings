import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.fitWidth,
        ),
        title: Text(
          "Orders",
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
        itemCount: 11,
        itemBuilder: (context, index) => (Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            ListTile(
              leading: Icon(Icons.new_label_outlined),
              title: Text("Hassam's house"),
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
            const Divider(
              thickness: 0.2,
              color: Colors.black,
            ),
          ],
        )),
      ),
    );
  }
}
