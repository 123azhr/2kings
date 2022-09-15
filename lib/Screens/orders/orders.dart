import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.fitWidth,
          ),
          title: Text(
            "Orders",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.ltr,
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              leading: Image.asset(
                "assets/images/logo-black-half.png",
                fit: BoxFit.fitWidth,
              ),
              title: Text("New Order"),
            ),
            const Divider(
              height: 20,
              thickness: 0.2,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
          ],
        ));
  }
}
