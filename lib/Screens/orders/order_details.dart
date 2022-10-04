import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/orders/logs.dart';
import 'package:housecontractors/components/profile_header.dart';
import '../../helper/size_configuration.dart';
import '../Chat/Inbox.dart';

Future<dynamic> Order_details(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
    builder: (context) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      color: Color.fromARGB(255, 255, 255, 255),
      child: Container(
        height: setHeight(59),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: setHeight(1)),
              decoration: BoxDecoration(
                color: Color.fromARGB(102, 243, 215, 33),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20,
                  ),
                ),
              ),
              height: setHeight(5),
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
              child: ProfileHeader(title: "hassam"),
            ),
            Container(
                height: setHeight(30),
                color: Color.fromARGB(255, 255, 255, 255),
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
                    const Divider(
                      thickness: 0.2,
                      color: Colors.black,
                      height: 2,
                    ),
                    Text(
                      "Started: " + "9/8/22",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                    Text(
                      "Ended:   " + "9/8/22",
                      style: TextStyle(
                        fontSize: getProportionateScreenHeight(16),
                      ),
                    ),
                    const Divider(
                      thickness: 0.2,
                      color: Colors.black,
                      height: 2,
                    ),
                    Text(
                        "hijasd fhdsi hisd ah dshf ohsduio fhdsuia fhsd fhsi dahf isdoahfi hdsauif ohdsiua hfioasdhf iosdh fiuhsda fihsdif huisadhfisdh afuioshdafui hsdaui fhsdiu ahfasidfhsda",
                        maxLines: 5),
                    Spacer(),
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
              color: Color.fromARGB(255, 255, 255, 255),
              child: Row(
                children: [
                  Container(
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
                            builder: (context) => Logs(title: "Hassam"),
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
                  ),
                  Spacer(),
                  Container(
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
                            builder: (context) => Logs(title: "Hassam"),
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
  );
}
