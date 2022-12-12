import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/Logs/view_aggrement.dart';
import 'package:housecontractors/Screens/orders/Logs/logs.dart';
import 'package:housecontractors/components/profile_header.dart';
import 'package:housecontractors/models/aggrement_model.dart';
import 'package:housecontractors/models/orders_model.dart';
import 'package:housecontractors/models/user_model.dart';
import 'package:housecontractors/providers/inventory_provider.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../models/inventory_model.dart';
import '../../models/service_log_model.dart';
import '../../providers/service_log_provider.dart';

Future<dynamic> orderDetails(
    BuildContext context,
    AggrementModel aggrementModel,
    UserModel customerModel,
    OrdersModel ordersModel) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: SizedBox(
          height: setHeight(59),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: setHeight(1)),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(102, 243, 215, 33),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                height: setHeight(4),
                width: setWidth(85),
                child: Center(
                  child: Text(
                    "About Order",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(20),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(setHeight(1)),
                color: Colors.greenAccent,
                height: setHeight(10),
                child: ProfileHeader(
                    title: customerModel.name!,
                    imageURL: customerModel.profileImageURL!,
                    email: customerModel.email!,
                    phoneNumber: customerModel.contactNumber!,
                    rating: customerModel.rating!),
              ),
              Container(
                  height: setHeight(30),
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order details",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                            fontWeight: FontWeight.w600),
                      ),
                      Divider(
                        thickness: 0.2,
                        color: Colors.black,
                        height: getProportionateScreenHeight(2),
                      ),
                      Text(
                        "Started: " +
                            aggrementModel.startDate
                                .toString()
                                .split(" ")
                                .first,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                      Text(
                        "Ended:   " +
                            aggrementModel.startDate
                                .toString()
                                .split(" ")
                                .first,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                      Divider(
                        thickness: 0.2,
                        color: Colors.black,
                        height: getProportionateScreenHeight(2),
                      ),
                      SizedBox(
                        height: setHeight(5),
                        child: Text(
                          aggrementModel.details!,
                          maxLines: 5,
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.black,
                        height: 0,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(getProportionateScreenHeight(12)),
                height: setHeight(11),
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Row(
                  children: [
                    SizedBox(
                      height: setHeight(7),
                      width: setWidth(30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amberAccent,
                          ),
                        ),
                        onPressed: () async {
                          // showDialog(
                          //     context: context,
                          //     builder: (context) => const Center(
                          //         child: CircularProgressIndicator()));
                          // ServiceLogsProvider serviceLogsProvider =
                          //     Provider.of<ServiceLogsProvider>(context,
                          //         listen: false);

                          // InventoryProvider inventoryProvider =
                          //     Provider.of<InventoryProvider>(context,
                          //         listen: false);
                          // await serviceLogsProvider
                          //     .fetchServiceLog(ordersModel.logsID!);
                          // await inventoryProvider
                          //     .fetchInventory(ordersModel.logsID!);

                          // List<InventoryModel> inventoryList =
                          //     inventoryProvider.getInventoryList;
                          // List<ServiceLogModel> serviceLogList =
                          //     serviceLogsProvider.getServicelist;
                          // Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Logs(
                                title: customerModel.name!,
                                ordersModel: ordersModel,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "View Logs",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: getProportionateScreenHeight(18),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: setHeight(7),
                      width: setWidth(30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.amberAccent,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ViewAggrement(),
                            ),
                          );
                        },
                        child: Text(
                          "View Aggrement",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: getProportionateScreenHeight(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
