import 'package:flutter/material.dart';

import '../../../helper/size_configuration.dart';
import '../workers/workers_list.dart';

class HireContractor extends StatelessWidget {
  const HireContractor({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                WorkersList(workerName: "Arsalan", serviceName: "Contractors"),
          )),
      child: Card(
        child: Container(
          height: getProportionateScreenHeight(160),
          width: getProportionateScreenWidth(500),
          child: const Text("Hire a Contractor"),
          padding: EdgeInsets.all(getProportionateScreenHeight(10)),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
