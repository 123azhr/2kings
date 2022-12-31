import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:housecontractors/models/comments_model.dart';
import 'package:housecontractors/providers/comments_provider.dart';
import 'package:housecontractors/providers/customer_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/post_model.dart';
import '../../../providers/post_provider.dart';

class OpenComments extends StatefulWidget {
  const OpenComments({
    super.key,
    required this.postModel,
    required this.postProvider,
    required this.commentsProvider,
  });
  final PostModel postModel;
  final PostProvider postProvider;
  final CommentsProvider commentsProvider;

  @override
  State<OpenComments> createState() => _OpenCommentsState();
}

class _OpenCommentsState extends State<OpenComments> {
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final commentsProvider = Provider.of<CommentsProvider>(context);
    commentsProvider.fetch();
    final commentsList =
        widget.commentsProvider.getCommentByPostID(widget.postModel.postID!);
    final customerProvider = Provider.of<CustomerProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: setHeight(90),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(),
            shrinkWrap: true,
            reverse: true,
            scrollDirection: Axis.vertical,
            itemCount: commentsList.length,
            itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                value: commentsList[index],
                child: ListTile(
                  minLeadingWidth: 50,
                  leading: SizedBox(
                    height: setHeight(10),
                    width: setWidth(10),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: customerProvider
                            .getUserByID(commentsList[index].userID!)
                            .profileImageURL!,
                      ),
                    ),
                  ),
                  title: Text(customerProvider
                      .getUserByID(commentsList[index].userID!)
                      .name!),
                  subtitle: Text(commentsList[index].text!),
                )),

            physics: const BouncingScrollPhysics(),

            // SizedBox(
            //   height: setHeight(7),
            //   child: MyTextField(
            //       width: setWidth(
            //         99,
            //       ),
            //       hintText: "Comment your view",
            //       leading: const Icon(Icons.send_sharp),
            //       radius: getProportionateScreenWidth(20),
            //       controller: commentController),
            // ),
          ),
        ),
        
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  const CommentTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customerProvider = Provider.of<CustomerProvider>(context);
    final commentsModel = Provider.of<CommentsModel>(context);
    final user = customerProvider.getUserByID(commentsModel.userID!);
    return ListTile(
      minLeadingWidth: 50,
      leading: ClipOval(
        child: CachedNetworkImage(
          imageUrl: user.profileImageURL!,
        ),
      ),
      title: Text(user.name!),
      subtitle: Text(commentsModel.text!),
    );
  }
}
