import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class StoryView extends StatelessWidget {
  final String url;
  const StoryView({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: Colors.black,
      child: Stack(children: [
        Center(child: Image.network(url)),
        Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(foregroundImage: NetworkImage(url)),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "Muhammad Azhar",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )),
      ]),
    ));
  }
}
