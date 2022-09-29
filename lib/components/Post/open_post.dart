import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/post.dart';
import 'package:housecontractors/components/Post/post_item.dart';

class OpenPost extends StatelessWidget {
  const OpenPost({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: PostItem());
  }
}
