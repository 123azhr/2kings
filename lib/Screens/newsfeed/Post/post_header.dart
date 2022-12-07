import 'package:flutter/material.dart';

import '../../profile/profile_view.dart';
import '../../../helper/size_configuration.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.userID,
    required this.title,
    required this.profilePicURL,
    required this.date,
  }) : super(key: key);

  final String? userID;
  final String profilePicURL;
  final String title;
  final DateTime? date;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
          child: Image.network(
            profilePicURL,
            fit: BoxFit.cover,
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenWidth(40),
          ),
        ),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(date.toString()),
      trailing: PopupMenuButton(itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Text("Remove this post"),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text("Edit this post."),
          ),
          PopupMenuItem<int>(
            value: 2,
            child: Text("report"),
          ),
        ];
      }, onSelected: (value) {
        if (value == 0) {
          print("Remove this notification menu is selected.");
        } else if (value == 1) {
          print("Turn off notification about this. menu is selected.");
        } else if (value == 2) {
          print("report menu is selected.");
        }
      }),
    );
  }
}
