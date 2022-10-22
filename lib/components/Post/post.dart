import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/post_bottom.dart';
import 'package:housecontractors/components/Post/post_header.dart';
import 'package:housecontractors/components/Post/post_item.dart';
import 'package:housecontractors/models/post_model.dart';
import 'package:provider/provider.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<PostModel>(context);
    return Card(
      color: const Color.fromARGB(255, 255, 230, 149),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostHeader(title: title, date: postModel.postedTime),
          PostItem(imageURL: postModel.imageURL),
          PostBottom(),
        ],
      ),
    );
  }
}
