import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/models/agreement_model.dart';
import 'package:housecontractors/providers/agreement_provider.dart';
import 'package:housecontractors/providers/service_log_provider.dart';
import 'package:provider/provider.dart';
import '../../../helper/size_configuration.dart';
import '../../../models/orders_model.dart';
import '../../../providers/order_provider.dart';

class AddServiceItem extends StatefulWidget {
  const AddServiceItem({
    Key? key,
    required this.ordersModel,
  }) : super(key: key);
  final OrdersModel ordersModel;

  @override
  State<AddServiceItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddServiceItem> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController daysController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceLogsProvider>(context);

    final agreementProvider = Provider.of<AgreementProvider>(context);

    AgreementModel agreementModel =
        agreementProvider.getAgreementByID(widget.ordersModel.aggrementID!);

    bool _isButtonDisabled = nameController.text.isNotEmpty &&
        daysController.text.isNotEmpty &&
        priceController.text.isNotEmpty;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: getProportionateScreenWidth(40),
          leading: Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.contain,
          ),
          title: const Text(
            "Add Service",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 1,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: setHeight(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Item Name: ",
                        style: TextStyle(fontSize: 24),
                      ),
                      const Spacer(),
                      MyTextField(
                        color: const Color.fromARGB(255, 255, 239, 63),
                        width: setWidth(65),
                        radius: 20,
                        controller: nameController,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Days: ",
                        style: TextStyle(fontSize: 24),
                      ),
                      const Spacer(),
                      MyTextField(
                        color: const Color.fromARGB(255, 255, 239, 63),
                        width: setWidth(65),
                        radius: 20,
                        controller: daysController,
                        inputType: TextInputType.number,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Per Day: ",
                        style: TextStyle(fontSize: 24),
                      ),
                      const Spacer(),
                      MyTextField(
                        color: const Color.fromARGB(255, 255, 239, 63),
                        width: setWidth(65),
                        radius: 20,
                        controller: priceController,
                        inputType: TextInputType.number,
                        onChanged: (p0) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(getProportionateScreenWidth(200),
                            getProportionateScreenHeight(50)),
                        side: const BorderSide(
                          width: 0,
                        ),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      onPressed: _isButtonDisabled
                          ? () async {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: ((context) => WillPopScope(
                                      onWillPop: () async => false,
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    )),
                              );
                              await serviceProvider.uploadItemDataToFireStore(
                                  serviceName: nameController.text,
                                  perDay: priceController.text,
                                  noOfDays: daysController.text,
                                  customerID: agreementModel.customerID,
                                  logsID: widget.ordersModel.logsID,
                                  total: (int.parse(daysController.text) *
                                          int.parse(priceController.text))
                                      .toString());
                              final orderProvider = Provider.of<OrdersProvider>(
                                  context,
                                  listen: false);
                              await orderProvider.updateServiceTotal(
                                  orderID: widget.ordersModel.orderID!,
                                  serviceTotal: serviceProvider.serviceTotal(),
                                  customerID: agreementModel.customerID!);

                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          : null,
                      child: const Text("Add")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
