import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';

class ViewServicesLogs extends StatelessWidget {
  ViewServicesLogs({
    Key? key,
    this.tog = false,
  }) : super(key: key);
  final bool? tog;
  TableRow addTableRow(
    String id,
    String serviceName,
    String noOfDays,
    String perDay,
    String charges,
  ) {
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
                serviceName,
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
                noOfDays,
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
                perDay,
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
                charges,
                style: TextStyle(
                  fontSize: getProportionateScreenHeight(18),
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
                  const ServicesTableHeader(),
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(30),
                      1: FixedColumnWidth(150),
                      2: FixedColumnWidth(50)
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: <TableRow>[
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("1", "Sariya lagayaa", "2", "1500", "3000"),
                      addTableRow("2", "Sariya lagayaa", "2", "1500", "3000"),
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
                                              getProportionateScreenHeight(
                                                  25))),
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
                                              getProportionateScreenHeight(
                                                  25))),
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
          ),
        ),
      ),
    );
  }
}

class ServicesTableHeader extends StatelessWidget {
  const ServicesTableHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(30),
        1: FixedColumnWidth(150),
        2: FixedColumnWidth(50)
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
                    "Service",
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
                    "Days",
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
                    "Per Day",
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
                    "Total Charge",
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
