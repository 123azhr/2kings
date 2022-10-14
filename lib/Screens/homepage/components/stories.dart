import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: getProportionateScreenHeight(170),
        child: Stack(
          children: [
            Container(
              color: Colors.amber,
              padding: EdgeInsets.only(left: setWidth(20)),
              margin: EdgeInsets.only(top: setWidth(0.5)),
              width: setWidth(100),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(5),
                  itemExtent: setWidth(22),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        MyContainer(
                          height: setHeight(18),
                          width: setWidth(20),
                        ),
                        SizedBox(
                          width: setWidth(20),
                        ),
                      ],
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(top: setHeight(1.5)),
              child: MyContainer(
                color: Colors.amberAccent,
                height: setHeight(18),
                width: setWidth(20),
                child: Icon(Icons.add_circle),
              ),
            ),
          ],
        ));
  }
}
