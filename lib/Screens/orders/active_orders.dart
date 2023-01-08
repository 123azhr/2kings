// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:housecontractors/models/orders_model.dart';
import 'package:housecontractors/widgets/are_you_sure.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../models/agreement_model.dart';
import '../../models/customer_model.dart';
import '../../providers/agreement_provider.dart';
import '../../providers/customer_provider.dart';
import '../../providers/order_provider.dart';
import 'order_details.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);
    List<OrdersModel> ordersList = ordersProvider.getList
        .where((element) => element.status == "Active")
        .toList();
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      scrollDirection: Axis.vertical,
      itemCount: ordersList.length,
      itemBuilder: (context, int index) => ChangeNotifierProvider.value(
        value: ordersList[index],
        child: ActiveOrderTile(ordersModel: ordersList[index]),
      ),
      physics: const BouncingScrollPhysics(),
    );
  }
}

class ActiveOrderTile extends StatelessWidget {
  const ActiveOrderTile({
    Key? key,
    required this.ordersModel,
  }) : super(key: key);
  final OrdersModel ordersModel;
  @override
  Widget build(BuildContext context) {
    AgreementProvider aggrementProvider =
        Provider.of<AgreementProvider>(context);
    AgreementModel aggrementModel =
        aggrementProvider.getAgreementByID(ordersModel.aggrementID!);
    CustomerProvider userProvider = Provider.of<CustomerProvider>(context);
    CustomerModel customerModel =
        userProvider.getUserByID(aggrementModel.customerID!);
    OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);
    return ListTile(
      onTap: () =>
          orderDetails(context, aggrementModel, customerModel, ordersModel),
      leading: const Icon(Icons.area_chart),
      title: Text(customerModel.name!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            aggrementModel.startDate.toString().split(" ").first,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            aggrementModel.details!,
          ),
        ],
      ),
      trailing: PopupMenuButton(itemBuilder: (context) {
        return [
          const PopupMenuItem<int>(
            value: 0,
            child: Text("End This Order"),
          ),
        ];
      }, onSelected: (value) {
        if (value == 0) {
          showDialog(
            context: context,
            builder: (context) => AreYouSure(
                title: "Are you sure?",
                onPressed: () async {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => WillPopScope(
                            onWillPop: () async => false,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ));
                  await ordersProvider.updateStatus(
                      ordersModel.orderID!, "Completed", customerModel.userID!);
                  Navigator.pop(context);
                }),
          );
        }
      }),
    );
  }
}
