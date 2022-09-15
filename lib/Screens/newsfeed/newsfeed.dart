import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/newsfeed/components/post.dart';

import '../../helper/size_configuration.dart';

class Newsfeed extends StatelessWidget {
  const Newsfeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.fitWidth,
        ),
        title: Text(
          "Newsfeed",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, int index) => Post(),
      ),
    );
  }
}
/* ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) => Post(),
        ),*/