import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        const SizedBox(
          height: 10,
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          leading:Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.fitWidth,
          ),
          title: Text("Orders"),
        ),
        const Divider(
          height: 20,
          thickness: 0.2,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
      ],
    );
  }
}
