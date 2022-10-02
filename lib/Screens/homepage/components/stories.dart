import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(140),
        child: Row(
          children: [
            MyContainer(
              height: getProportionateScreenHeight(120),
              width: getProportionateScreenWidth(70),
              child: Icon(Icons.add_circle),
            ),
            SizedBox(
              width: getProportionateScreenWidth(280),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemExtent: getProportionateScreenWidth(80),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MyContainer(
                            height: getProportionateScreenHeight(120),
                            width: getProportionateScreenWidth(100)),
                        SizedBox(
                          width: getProportionateScreenWidth(75),
                        ),
                      ],
                    );
                  }),
            )
          ],
        ));
  }
}
