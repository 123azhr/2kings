import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            leading: ClipOval(
              child: Image.network(
                "https://scontent.fkhi2-3.fna.fbcdn.net/v/t39.30808-6/295854415_3148830022097963_3614660864564168800_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFTrxgtUzCI8CBdoTVjjk01Nh0WRNPb8pY2HRZE09vyllY0Q4P_gYMH5GT5JaGhm2tJENjahhepJy4vQOrSL9L7&_nc_ohc=vqY_ENQJ7scAX8gzz3s&_nc_ht=scontent.fkhi2-3.fna&oh=00_AT-U5RqZ-EHobpJ9YIZf7-oIygawqig234plBUDCHTfPgQ&oe=6301B971",
                fit: BoxFit.contain,
              ),
            ),
            title: Text("Muhammmad Azhar"),
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
            height: 10,
          ),
          Image.network(
            "https://scontent.fkhi2-3.fna.fbcdn.net/v/t39.30808-6/295854415_3148830022097963_3614660864564168800_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFTrxgtUzCI8CBdoTVjjk01Nh0WRNPb8pY2HRZE09vyllY0Q4P_gYMH5GT5JaGhm2tJENjahhepJy4vQOrSL9L7&_nc_ohc=vqY_ENQJ7scAX8gzz3s&_nc_ht=scontent.fkhi2-3.fna&oh=00_AT-U5RqZ-EHobpJ9YIZf7-oIygawqig234plBUDCHTfPgQ&oe=6301B971",
            fit: BoxFit.contain,
          ),
          Container(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.thumb_up),
              Text("Like"),
              VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                  width: 2,
                  endIndent: 0,
                  indent: 0),
              Icon(Icons.comment),
              Text("Comment"),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
