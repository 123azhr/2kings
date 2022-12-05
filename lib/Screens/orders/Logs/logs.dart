import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/viewInventoryLog.dart';
import 'package:housecontractors/Screens/orders/viewServicesLog.dart';
import 'package:housecontractors/models/orders_model.dart';
import '../../../helper/size_configuration.dart';
import '../../../models/inventory_model.dart';
import '../../../models/service_log_model.dart';

class Logs extends StatelessWidget {
  const Logs(
      {super.key,
      required this.title,
      required this.ordersModel,
      required this.inventoryList,
      required this.serviceLogList});
  final String title;
  final OrdersModel ordersModel;
  final List<InventoryModel> inventoryList;
  final List<ServiceLogModel> serviceLogList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                const Divider(
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
                const Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                GestureDetector(
                  child: SizedBox(
                    height: setHeight(33),
                    child: ViewInventoryLogs(inventoryList: inventoryList),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text(
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
                        body: ViewInventoryLogs(
                            tog: true, inventoryList: inventoryList),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.3,
                  color: Colors.black,
                ),
                const Divider(
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
                const Divider(
                  thickness: 0.2,
                  color: Colors.black,
                ),
                GestureDetector(
                  child: SizedBox(
                    height: setHeight(33),
                    child: ViewServicesLogs(serviceLogList: serviceLogList),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(
                          title: const Text(
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
                        body: ViewServicesLogs(
                            tog: true, serviceLogList: serviceLogList),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 0.3,
                  color: Colors.black,
                ),
                const Divider(
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
                      const Divider(
                        thickness: 0.3,
                        color: Colors.black,
                        height: 0,
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: const Text(
                          "Inventory Total: ",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: Text(
                          ordersModel.inventoryTotal!,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const Spacer(),
                      const VerticalDivider(color: Colors.black),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: const Text(
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
                          ordersModel.serviceTotal!,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      const Spacer(),
                      const VerticalDivider(color: Colors.black),
                      Container(
                        padding:
                            EdgeInsets.all(getProportionateScreenHeight(8)),
                        height: 50,
                        child: const Text(
                          "PKR",
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Divider(
                      height: 0,
                      thickness: 0.3,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: const Text(
                        "Grand Total: ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: Text(
                        ordersModel.grandTotal!,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const Spacer(),
                    const VerticalDivider(color: Colors.black),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: const Text(
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
