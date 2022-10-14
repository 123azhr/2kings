import 'package:flutter/material.dart';

import '../../Screens/profile/profile_view.dart';
import '../../helper/size_configuration.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required this.title,
    this.date,
  }) : super(key: key);

  final String title;
  final DateTime? date;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfileView(
                      title: title,
                    )),
          ),
          child: Image.network(
            "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            fit: BoxFit.cover,
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenWidth(40),
          ),
        ),
      ),
      title: Text(title),
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
