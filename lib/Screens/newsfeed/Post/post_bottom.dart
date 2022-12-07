import 'package:flutter/material.dart';

import '../../../helper/size_configuration.dart';
import 'comments.dart';
import 'like.dart';

class PostBottom extends StatelessWidget {
  const PostBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
