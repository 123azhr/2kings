import 'package:flutter/material.dart';
import 'package:housecontractors/models/current_user.dart';
import 'package:housecontractors/models/post_model.dart';
import 'package:housecontractors/providers/current_user_provider.dart';
import 'package:provider/provider.dart';

import '../../../helper/size_configuration.dart';
import 'comments.dart';
import 'like.dart';

class PostBottom extends StatefulWidget {
  const PostBottom({
    required this.postModel,
    Key? key,
  }) : super(key: key);
  final PostModel postModel;

  @override
  State<PostBottom> createState() => _PostBottomState();
}

class _PostBottomState extends State<PostBottom> {
  @override
  Widget build(BuildContext context) {
    final currentUserProvider = Provider.of<CurrentUserProvider>(context);
    String loggedinUserID = currentUserProvider.getCurrentUser().userID!;
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
                isLiked: widget.postModel.likes!.contains(loggedinUserID),
              ),
              onTap: () {
                if (!widget.postModel.likes!.contains(loggedinUserID)) {
                  widget.postModel.likes!.add(loggedinUserID);
                }
                setState(() {});
              }),
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
