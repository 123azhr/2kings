import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/Logs/view_aggrement.dart';
import 'package:housecontractors/Screens/orders/Logs/logs.dart';
import 'package:housecontractors/models/agreement_model.dart';
import 'package:housecontractors/models/orders_model.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../models/customer_model.dart';
import '../../providers/order_provider.dart';
import '../../widgets/mycontainer.dart';

Future<dynamic> orderDetails(
    BuildContext context,
    AgreementModel aggrementModel,
    CustomerModel customerModel,
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
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(60),
                          width: getProportionateScreenWidth(60),
                          child: CircleAvatar(
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl: customerModel.profileImageURL!,
                                fit: BoxFit.cover,
                                height: getProportionateScreenHeight(60),
                                width: getProportionateScreenHeight(60),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenHeight(8)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                customerModel.name!,
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(20),
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                customerModel.email!,
                                style: TextStyle(
                                  fontSize: getProportionateScreenHeight(14),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                customerModel.contactNumber!,
                                style: TextStyle(
                                  fontSize: getProportionateScreenHeight(14),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ]),
                ),
              ),
              Container(
                  height: setHeight(30),
                  color: const Color.fromARGB(255, 255, 255, 255),
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
                        "Start Date: " +
                            aggrementModel.startDate
                                .toString()
                                .split(" ")
                                .first,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(16),
                        ),
                      ),
                      Text(
                        "End Date:   " +
                            aggrementModel.endDate.toString().split(" ").first,
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
                    ordersModel.status != "Pending"
                        ? SizedBox(
                            height: setHeight(7),
                            width: setWidth(30),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.amberAccent,
                                ),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Logs(
                                      agreementModel: aggrementModel,
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
                          )
                        : SizedBox(
                            height: setHeight(7),
                            width: setWidth(30),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  Colors.amberAccent,
                                ),
                              ),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: ((context) => WillPopScope(
                                        onWillPop: () async => false,
                                        child: const Center(
                                            child: CircularProgressIndicator()),
                                      )),
                                );
                                try {
                                  OrdersProvider orderProvider =
                                      Provider.of<OrdersProvider>(context,
                                          listen: false);
                                  orderProvider.updateStatus(
                                      ordersModel.orderID!,
                                      "Active",
                                      aggrementModel.customerID!);

                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                  orderProvider.removeListener(() {});
                                } catch (e) {
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) => Center(
                                        child: MyContainer(
                                      height: setHeight(10),
                                      width: setWidth(50),
                                      child: Text("Error Accepting Order " +
                                          e.toString()),
                                    )),
                                  );
                                }
                              },
                              child: Text(
                                "Start Order",
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
                              builder: (context) => ViewAgreement(
                                  agreementID: aggrementModel.agreementID!),
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
