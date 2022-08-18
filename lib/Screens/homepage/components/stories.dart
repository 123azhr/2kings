import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/widgets/mycontainer.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(5),
        reverse: false,
        children: [
          MyContainer(height: 100, width: 100),
          SizedBox(
            width: 5,
          ),
          MyContainer(height: 100, width: 100),
          SizedBox(
            width: 5,
          ),
          MyContainer(height: 100, width: 100),
          SizedBox(
            width: 5,
          ),
          MyContainer(height: 100, width: 100),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
