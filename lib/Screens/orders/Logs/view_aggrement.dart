import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helper/size_configuration.dart';
import '../../../models/agreement_model.dart';
import '../../../models/contractor_model.dart';
import '../../../models/customer_model.dart';
import '../../../providers/agreement_provider.dart';
import '../../../providers/contractor_provider.dart';
import '../../../providers/customer_provider.dart';
import '../../../providers/inventory_provider.dart';
import '../../../providers/order_provider.dart';
import '../../../providers/service_log_provider.dart';

class ViewAgreement extends StatelessWidget {
  const ViewAgreement({super.key, required this.agreementID});
  final String agreementID;

  @override
  Widget build(BuildContext context) {
    AgreementProvider agreementProvider =
        Provider.of<AgreementProvider>(context);
    AgreementModel agreementModel =
        agreementProvider.getAgreementByID(agreementID);
    OrdersProvider ordersProvider = Provider.of<OrdersProvider>(context);
    ServiceLogsProvider servicelogsProvider =
        Provider.of<ServiceLogsProvider>(context);
    InventoryProvider inventoryProvider =
        Provider.of<InventoryProvider>(context);
    CustomerProvider userProvider = Provider.of<CustomerProvider>(context);
    CustomerModel customerModel =
        userProvider.getUserByID(agreementModel.customerID!);

    ContractorsProvider currentUserProvider =
        Provider.of<ContractorsProvider>(context);
    ContractorsModel contractorModel =
        currentUserProvider.getUserByID(agreementModel.contractorID!);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leadingWidth: getProportionateScreenWidth(40),
              leading: Image.asset(
                "assets/images/logo-black-half.png",
                fit: BoxFit.contain,
              ),
              title: const Text(
                "Agreement",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: (kToolbarHeight / 100) * 40,
                ),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SizedBox(
              height: setHeight(100),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            thickness: 0.4,
                          ),
                          const Center(
                            child: Text(
                              "Customer details",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            softWrap: true,
                            "Name: " + customerModel.name!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            softWrap: true,
                            "ID: " + customerModel.userID!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            softWrap: true,
                            "CNIC: " + customerModel.cnic!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.4),
                          const Center(
                            child: Text(
                              "Contractor details",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(10)),
                          Text(
                            softWrap: true,
                            "Name: " + contractorModel.name!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            softWrap: true,
                            "ID: " + contractorModel.userID!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            softWrap: true,
                            "CNIC: " + contractorModel.cnic!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.4),
                          Text(
                            "Start Date:" + agreementModel.startDate.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          Text(
                            "End Date: " + agreementModel.startDate.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          const Divider(thickness: 0.4),
                          const Center(
                            child: Text(
                              "Services",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                          ),
                          const Divider(thickness: 0.4),
                          SizedBox(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  agreementModel.services!.toList().length,
                              itemBuilder: (context, int index) => Text(
                                (index + 1).toString() +
                                    ".  " +
                                    agreementModel.services!.elementAt(index),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ),
                          const Divider(thickness: 0.4),
                          const SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "Agreement details",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ),
                          ),
                          Text(
                            agreementModel.details!,
                            softWrap: true,
                          ),
                        ]),
                  ),
                ),
              ),
            )));
  }
}
