import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';

class ViewInventoryLogs extends StatelessWidget {
  ViewInventoryLogs({
    Key? key,
    this.tog = false,
  }) : super(key: key);
  final bool? tog;
  TableRow addTableRow(String id, String itemName, String qty, String unit,
      String perUnit, String price) {
    return TableRow(
      children: <Widget>[
        TableCell(
          child: Container(
            height: setHeight(5),
            width: setWidth(10),
            child: Center(
              child: Text(
                id,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: setHeight(5),
            width: setWidth(40),
            child: Center(
              child: Text(
                itemName,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: setHeight(5),
            width: setWidth(10),
            child: Center(
              child: Text(
                qty,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: setHeight(5),
            width: setWidth(10),
            child: Center(
              child: Text(
                unit,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: setHeight(5),
            width: setWidth(10),
            child: Center(
              child: Text(
                perUnit,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
                ),
              ),
            ),
          ),
        ),
        TableCell(
          child: Container(
            height: setHeight(5),
            width: setWidth(10),
            child: Center(
              child: Text(
                price,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(20),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const InventoryTableHeader(),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(30),
                      1: FixedColumnWidth(130),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                      addTableRow("1", "Sariya", "8", "inch", "100", "800"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Visibility(
        visible: tog!,
        child: BottomAppBar(
            child: Row(
          children: [
            Card(
              child: Container(
                height: setHeight(20),
                child: Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(130),
                    1: FixedColumnWidth(239),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: SizedBox(
                              height: setHeight(5),
                              child: Center(
                                child: Text("Total: ",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(25))),
                              )),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: setHeight(5),
                            child: Center(
                              child: Text("Remaining: ",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(25))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: SizedBox(
                              height: setHeight(5),
                              child: Center(
                                child: Text("Paid: ",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(25))),
                              )),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: setHeight(5),
                            child: Center(
                              child: Text("Remaining: ",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(25))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        TableCell(
                          child: SizedBox(
                            height: setHeight(5),
                            child: Center(
                              child: Text("Remaining: ",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(25))),
                            ),
                          ),
                        ),
                        TableCell(
                          child: SizedBox(
                            height: setHeight(5),
                            child: Center(
                              child: Text("Remaining: ",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(25))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}

class InventoryTableHeader extends StatelessWidget {
  const InventoryTableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(30),
        1: FixedColumnWidth(130),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              child: Container(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    "ID",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(20),
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                height: setHeight(5),
                width: setWidth(40),
                child: Center(
                  child: Text(
                    "Items",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    "Qty",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    "Unit",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    "P/Unit",
                    style: TextStyle(
                      fontSize: getProportionateScreenHeight(20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            TableCell(
              child: Container(
                height: setHeight(5),
                width: setWidth(10),
                child: Center(
                  child: Text(
                    "Price",
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
