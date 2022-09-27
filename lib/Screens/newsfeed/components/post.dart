import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/profile/profileView.dart';
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
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              child: GestureDetector(
                onTap: () =>  Navigator.push(
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
            subtitle: Text("10 Aug"),
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
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Image.network(
            "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
            fit: BoxFit.contain,
          ),
          Container(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.thumb_up),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text("Like"),
                  ],
                ),
                Container(
                  width: 1,
                  height: getProportionateScreenHeight(20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.comment),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text("Comment"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          )
        ],
      ),
    );
  }
}
