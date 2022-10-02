import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/post.dart';
import 'package:housecontractors/components/Post/post_item.dart';

import '../../helper/size_configuration.dart';
import 'comments.dart';
import 'like.dart';

class OpenPost extends StatelessWidget {
  const OpenPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Container(
              color: Color.fromARGB(255, 0, 0, 0),
              height: setHeight(31),
              child: Image.network(
                "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(50),
                  right: getProportionateScreenWidth(50),
                  bottom: getProportionateScreenHeight(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Like(
                      isLiked: false,
                    ),
                    onTap: () => Like(
                      isLiked: true,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: getProportionateScreenHeight(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Comments(isClicked: true),
                    child: Comments(isClicked: false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
