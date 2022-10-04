import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/logs.dart';

import 'order_details.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 11,
      itemBuilder: (context, index) => (Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        textDirection: TextDirection.ltr,
        children: [
          ListTile(
            onTap: () => Order_details(context),
            leading: Icon(Icons.area_chart),
            title: Text("Hassam Nusrat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Date: 26/09/2022",
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "order details",
                ),
              ],
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
          ),
          const Divider(
            thickness: 0.2,
            color: Colors.black,
          ),
        ],
      )),
    );
  }
}
