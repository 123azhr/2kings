import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/models/orders_model.dart';
import 'package:housecontractors/providers/order_provider.dart';
import 'package:provider/provider.dart';

import '../../../helper/size_configuration.dart';
import '../../../models/agreement_model.dart';
import '../../../providers/agreement_provider.dart';
import '../../../providers/inventory_provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({
    Key? key,
    required this.ordersModel,
  }) : super(key: key);
  final OrdersModel ordersModel;
  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController qtyController = TextEditingController();

  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<InventoryProvider>(context);
    final agreementProvider = Provider.of<AgreementProvider>(context);

    AgreementModel agreementModel =
        agreementProvider.getAgreementByID(widget.ordersModel.aggrementID!);
    bool _isButtonDisabled = nameController.text.isNotEmpty &&
        qtyController.text.isNotEmpty &&
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
            "Add Item",
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
                        "Quantity: ",
                        style: TextStyle(fontSize: 24),
                      ),
                      const Spacer(),
                      MyTextField(
                        color: const Color.fromARGB(255, 255, 239, 63),
                        width: setWidth(65),
                        radius: 20,
                        controller: qtyController,
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
                        "Per Item: ",
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
                                      onWillPop: () async => true,
                                      child: const Center(
                                          child: CircularProgressIndicator()),
                                    )),
                              );
                              await inventoryProvider.uploadItemDataToFireStore(
                                  itemName: nameController.text,
                                  perItem: priceController.text,
                                  qty: qtyController.text,
                                  logsID: widget.ordersModel.logsID,
                                  customerID: agreementModel.customerID,
                                  total: (int.parse(qtyController.text) *
                                          int.parse(priceController.text))
                                      .toString());
                              final orderProvider = Provider.of<OrdersProvider>(
                                  context,
                                  listen: false);
                              await orderProvider.updateInventoryTotal(
                                  orderID: widget.ordersModel.orderID!,
                                  inventoryTotal:
                                      inventoryProvider.inventoryTotal(),
                                  customerID: agreementModel.customerID!);
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          : null,
                      child: const Text("Add"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
