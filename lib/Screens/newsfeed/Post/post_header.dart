import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/providers/contractor_provider.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:provider/provider.dart';

import '../../../widgets/are_you_sure.dart';
import '../../profile/profile_view.dart';
import '../../../helper/size_configuration.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.postID,
    required this.userID,
    required this.title,
    required this.profilePicURL,
    required this.date,
  }) : super(key: key);

  final String? postID;
  final String? userID;
  final String profilePicURL;
  final String title;
  final DateTime? date;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<ContractorsProvider>(context);
    final loggedInUser = userProvider.getUserByID(currentUserID);
    final postProvider = Provider.of<PostProvider>(context);

    return SizedBox(
      height: setHeight(7),
      child: ListTile(
          minLeadingWidth: setWidth(10),
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfileView(
                          userID: userID!,
                        )),
              ),
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) =>
                    const Center(child: CircularProgressIndicator()),
                imageUrl: profilePicURL,
                fit: BoxFit.cover,
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),
              ),
            ),
          ),
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text(date.toString()),
          trailing: loggedInUser.userID == userID
              ? PopupMenuButton(itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          Text("Delete this post"),
                        ],
                      ),
                    ),
                  ];
                }, onSelected: (value) {
                  if (value == 0) {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => AreYouSure(
                          title: "Are Sure You?",
                          onPressed: () async {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => WillPopScope(
                                onWillPop: () async => false,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                            );
                            await postProvider.deletePost(postID: postID);
                            postProvider.fetch();
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }),
                    );
                  }
                })
              : SizedBox(height: setHeight(0), width: setWidth(0))),
    );
  }
}
