import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/Logs/add_item.dart';
import 'package:housecontractors/models/orders_model.dart';
import 'package:housecontractors/providers/inventory_provider.dart';
import 'package:housecontractors/widgets/are_you_sure.dart';
import 'package:provider/provider.dart';

import '../../../helper/size_configuration.dart';

class ViewInventoryLogs extends StatelessWidget {
  const ViewInventoryLogs({
    Key? key,
    required this.ordersModel,
    this.tog = false,
  }) : super(key: key);

  final OrdersModel ordersModel;
  final bool? tog;

  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<InventoryProvider>(context);
    final inventoryList = inventoryProvider.getInventoryList;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: setHeight(5),
              child: const InventoryTableRow(
                  itemName: "Items",
                  perUnit: "P/Unit",
                  price: "Price",
                  qty: "Qty"),
            ),
            SizedBox(
              height: setHeight(80),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: inventoryList.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: inventoryList[index],
                  builder: (context, child) => InkWell(
                    onLongPress: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AreYouSure(
                          title: "Delete this Item",
                          onPressed: () async {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) =>
                                  const CircularProgressIndicator(),
                            );
                            await inventoryProvider.deleteItem(
                                logsID: ordersModel.logsID!,
                                inventoryID: inventoryList[index].inventoryID);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    child: InventoryTableRow(
                        itemName: inventoryList[index].itemName!,
                        perUnit: inventoryList[index].perItem!,
                        price: inventoryList[index].total!,
                        qty: inventoryList[index].qty!),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Visibility(
        visible: tog!,
        child: BottomAppBar(
            child: Container(
          color: Colors.yellow,
          height:
              ordersModel.status == "Completed" ? setHeight(7) : setHeight(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: ordersModel.status != "Completed",
                child: SizedBox(
                  height: setHeight(7),
                  child: Row(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(setWidth(40), setHeight(5)),
                              side: const BorderSide(
                                width: 0,
                              ),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => AddItem(
                                        ordersModel: ordersModel,
                                      ));
                            },
                            child: const Text("Add Item")),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: setHeight(7),
                child: Row(
                  children: [
                    const Divider(
                      thickness: 0.3,
                      color: Colors.black,
                      height: 0,
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: const Text(
                        "Inventory Total: ",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                      height: 50,
                      child: Text(
                        inventoryProvider.inventoryTotal(),
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
              ),
            ],
          ),
        )),
      ),
    );
  }
}

class InventoryTableRow extends StatelessWidget {
  const InventoryTableRow({
    Key? key,
    required this.itemName,
    required this.qty,
    required this.perUnit,
    required this.price,
  }) : super(key: key);
  final String itemName;
  final String qty;
  final String perUnit;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(100),
        1: FixedColumnWidth(50),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              child: SizedBox(
                height: setHeight(5),
                width: setWidth(40),
                child: Center(
                  child: Text(
                    itemName,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: SizedBox(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    qty,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: SizedBox(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    perUnit,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: SizedBox(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    price,
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
