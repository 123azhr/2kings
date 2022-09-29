import 'package:flutter/material.dart';

import '../../helper/size_configuration.dart';

class MyMessages extends StatelessWidget {
  const MyMessages({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          height: getProportionateScreenHeight(40),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            border: Border.all(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: setHeight(5 / 2)),
          ),
        ),
      ],
    );

    //  isOpposite?
    // Column(

    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Container(
    //       color: Colors.amberAccent,
    //       height: 20,
    //       width: 20,
    //     ),
    //   ],
    // ):
    // Column(
    //   crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Container(
    //       color: Colors.amberAccent,
    //       height: 20,
    //       width: 20,
    //     ),
    //   ],
    // );

    // return Card(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(
    //       Radius.circular(
    //         getProportionateScreenWidth(20),
    //       ),
    //     ),
    //   ),
    //   child: Container(
    //     height: setHeight(5),
    //     decoration: BoxDecoration(
    //       color: Colors.amber,
    //       border: Border.all(),
    //       borderRadius: const BorderRadius.all(
    //         Radius.circular(20),
    //       ),
    //     ),
    //     child: Center(
    //         child: text,
    //         ),
    //   ),
    // );
  }
}
