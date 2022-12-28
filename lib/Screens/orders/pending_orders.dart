import 'package:flutter/material.dart';
import 'package:housecontractors/models/customer_model.dart';
import 'package:housecontractors/models/orders_model.dart';
import 'package:provider/provider.dart';

import '../../helper/size_configuration.dart';
import '../../models/agreement_model.dart';
import '../../providers/agreement_provider.dart';
import '../../providers/customer_provider.dart';
import '../../providers/order_provider.dart';
import 'order_details.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({
    Key? key,
  }) : super(key: key);

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  @override
  Widget build(BuildContext context) {
    OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);
    ordersProvider.fetch();
    List<OrdersModel> ordersList = ordersProvider.getList
        .where((element) => element.status == "Pending")
        .toList();

    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      scrollDirection: Axis.vertical,
      itemCount: ordersList.length,
      itemBuilder: (context, int index) => ChangeNotifierProvider.value(
        value: ordersList[index],
        child: PendingOrderTile(ordersModel: ordersList[index]),
      ),
      physics: const BouncingScrollPhysics(),
    );
    //  ListView.separated(
    //   separatorBuilder: (context, index) => const Divider(
    //     thickness: 0.2,
    //     color: Colors.black,
    //   ),
    //   itemCount: 11,
    //   itemBuilder: (context, index) => (Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     textDirection: TextDirection.ltr,
    //     children: [
    //       PendingOrderTile(),
    //     ],
    //   )),
    // );
  }
}

class PendingOrderTile extends StatelessWidget {
  const PendingOrderTile({
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
    return ListTile(
      onTap: () =>
          orderDetails(context, aggrementModel, customerModel, ordersModel,),
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
            child: Text("Remove this notification"),
          ),
          const PopupMenuItem<int>(
            value: 1,
            child: Text("Turn off notification about this."),
          ),
          const PopupMenuItem<int>(
            value: 2,
            child: Text("report"),
          ),
        ];
      }, onSelected: (value) {
        if (value == 0) {
        } else if (value == 1) {
        } else if (value == 2) {}
      }),
    );
  }
}
