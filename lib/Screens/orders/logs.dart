import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/viewInventoryLog.dart';
import 'package:housecontractors/Screens/orders/viewServicesLog.dart';
import 'package:housecontractors/Screens/profile/profileHeader.dart';
import '../../helper/size_configuration.dart';

class Logs extends StatelessWidget {
  const Logs({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Logs",
          style: TextStyle(
            color: Colors.black,
            fontSize: (kToolbarHeight / 100) * 50,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          ProfileHeader(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: setWidth(2), vertical: setHeight(0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                Text(
                  "View Inventory Logs",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: setHeight(2.5),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                GestureDetector(
                  child: SizedBox(
                    height: setHeight(33),
                    child: ViewInventoryLogs(),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(
                            "Inventory logs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: (kToolbarHeight / 100) * 50,
                            ),
                          ),
                          centerTitle: true,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        body: ViewInventoryLogs(),
                      ),
                    ),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                Text(
                  "View Services Logs",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: setHeight(2.5),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                GestureDetector(
                  child: SizedBox(
                    height: setHeight(33),
                    child: ViewServicesLogs(),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: Text(
                            "Inventory logs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: (kToolbarHeight / 100) * 50,
                            ),
                          ),
                          centerTitle: true,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        body: ViewServicesLogs(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Container(
              height: 50,
              width: getProportionateScreenWidth(375 / 2),
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call),
                  Text("Call"),
                ],
              ),
            ),
            Container(
              height: 50,
              width: getProportionateScreenWidth(375 / 2),
              color: Color.fromARGB(255, 172, 255, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat),
                  Text("Chat"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
