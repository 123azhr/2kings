import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/models/agreement_model.dart';
import 'package:housecontractors/models/contractor_model.dart';
import 'package:housecontractors/models/customer_model.dart';
import 'package:housecontractors/providers/customer_provider.dart';
import 'package:provider/provider.dart';
import '../../providers/agreement_provider.dart';

import '../../providers/contractor_provider.dart';

class AgreementMsg extends StatelessWidget {
  const AgreementMsg({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Container(
          padding: const EdgeInsets.all(10),
          height: setHeight(70),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            border: Border.all(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: SendAgreement(
            agreementID: text,
          )),
    );
  }
}

class SendAgreement extends StatelessWidget {
  const SendAgreement({super.key, required this.agreementID});
  final String agreementID;

  @override
  Widget build(BuildContext context) {
    AgreementProvider agreementProvider =
        Provider.of<AgreementProvider>(context);
    AgreementModel agreementModel =
        agreementProvider.getAgreementByID(agreementID);

    CustomerProvider userProvider = Provider.of<CustomerProvider>(context);
    CustomerModel customerModel =
        userProvider.getUserByID(agreementModel.customerID!);

    ContractorsProvider currentUserProvider =
        Provider.of<ContractorsProvider>(context);
    ContractorsModel contractorModel = currentUserProvider.getCurrentUser();
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Name",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "Estimated Days",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "Estimated Charges",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                            ],
                          ),
                          const Divider(thickness: 0.4),
                          SizedBox(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  agreementModel.services!.toList().length,
                              itemBuilder: (context, int index) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    agreementModel.services!.elementAt(index),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                  Text(
                                    agreementModel.services!.elementAt(index),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                  Text(
                                    agreementModel.services!.elementAt(index),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                ],
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
