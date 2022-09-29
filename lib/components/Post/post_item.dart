import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/open_post.dart';

import '../../helper/size_configuration.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OpenPost(),
            )),
        child: Container(
          color: Color.fromARGB(255, 0, 0, 0),
          height: setHeight(31),
          child: Image.network(
            "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
