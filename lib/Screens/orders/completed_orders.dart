import 'package:flutter/material.dart';

import 'order_details.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({
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
          GestureDetector(
            onTap: () => Order_details(context),
            child: ListTile(
              leading: Icon(Icons.new_label_outlined),
              title: Text("Hassam's house",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
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
                  Container(
                    height: 20,
                    width: 20,
                    child: Icon(Icons.perm_contact_calendar),
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
