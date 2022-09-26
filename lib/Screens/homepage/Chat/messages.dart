import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Messages extends StatelessWidget {
  const Messages({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            getProportionateScreenWidth(20),
          ),
        ),
      ),
      child: Container(
        height: setHeight(5),
        decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
            child: Text(
          "$text",
          style: TextStyle(fontSize: setHeight(5 / 2)),
        )),
      ),
    );
  }
}
