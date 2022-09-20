import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';

class ViewInventoryLogs extends StatelessWidget {
  const ViewInventoryLogs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: setWidth(0), vertical: setHeight(0)),
                child: Container(
                  color: Color.fromARGB(255, 166, 72, 72),
                  height: setHeight(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
