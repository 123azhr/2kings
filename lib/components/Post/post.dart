import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/post_bottom.dart';
import 'package:housecontractors/components/Post/post_header.dart';
import 'package:housecontractors/components/Post/post_item.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Post extends StatelessWidget {
  const Post({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PostHeader(title: title),
          PostItem(),
          PostBottom(),
        ],
      ),
    );
  }
}