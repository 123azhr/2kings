import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/newsfeed/components/post.dart';

class Newsfeed extends StatelessWidget {
  const Newsfeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: TextDirection.ltr,
      children: [
        const SizedBox(
          height: 10,
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 4, vertical: -4),
          leading: Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.fitWidth,
          ),
          title: Text("Newsfeed"),
        ),
        const Divider(
          height: 10,
          thickness: 0.2,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) => Post(),
          ),
        )
      ],
    );
  }
}
/* ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) => Post(),
        ),*/