import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Chat/chat_menu.dart';
import 'package:housecontractors/Screens/orders/viewInventoryLog.dart';
import 'package:housecontractors/Screens/orders/viewServicesLog.dart';
import 'package:housecontractors/components/profile_header.dart';
import '../../../helper/size_configuration.dart';
import '../../../widgets/chat_call_bottom_bar.dart';

class Logs extends StatelessWidget {
  const Logs({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Logs",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: setWidth(2), vertical: setHeight(0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                Text(
                  "Inventory",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: setHeight(4),
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
                        body: ViewInventoryLogs(tog: true),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 0.3,
                  color: Colors.black,
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                  height: 0,
                ),
                Text(
                  "Services ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: setHeight(4),
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
                            "Services logs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: (kToolbarHeight / 100) * 50,
                            ),
                          ),
                          centerTitle: true,
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        body: ViewServicesLogs(tog: true),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 0.3,
                  color: Colors.black,
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                  height: 0,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
          color: Colors.amberAccent,
          child: SizedBox(
            height: getProportionateScreenHeight(125),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Divider(
                        thickness: 0.3,
                        color: Colors.black,
                        height: 0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          "Inventory Total: ",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          "48612315315 ",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Spacer(),
                      VerticalDivider(color: Colors.black),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          "PKR",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Divider(
                        thickness: 0.3,
                        color: Colors.black,
                        height: 0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          "Services Total: ",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          "48612315315 ",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Spacer(),
                      VerticalDivider(color: Colors.black),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          "PKR",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: Text(
                        "Grand Total: ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: Text(
                        "48612315315 ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Spacer(),
                    VerticalDivider(color: Colors.black),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: Text(
                        "PKR",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
