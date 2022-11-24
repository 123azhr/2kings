import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/post_bottom.dart';
import 'package:housecontractors/components/Post/post_header.dart';
import 'package:housecontractors/components/Post/post_item.dart';
import 'package:housecontractors/models/post_model.dart';
import 'package:provider/provider.dart';

import '../../providers/current_user_provider.dart';
import '../../providers/user_provider.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<PostModel>(context);
    final userProvider = Provider.of<CurrentUserProvider>(context);
    final user = userProvider.getCurrentUser();
    return Card(
      color: const Color.fromARGB(255, 255, 230, 149),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostHeader(
              userID: user.userID!,
              title: user.name!,
              date: postModel.postedTime,
              profilePicURL: user.profileImageURL!),
          PostItem(imageURL: postModel.imageURL, caption: postModel.caption),
          PostBottom(),
        ],
      ),
    );
  }
}
