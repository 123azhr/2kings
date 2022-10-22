import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class StoryView extends StatelessWidget {
  final String? itemURL;
  final String? userImgUrl;
  final String? userName;
  const StoryView({
    super.key,
    required this.itemURL,
    required this.userImgUrl,
    required this.userName,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: Colors.black,
      child: Stack(children: [
        Center(child: Image.network(itemURL!)),
        Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(foregroundImage: NetworkImage(userImgUrl!)),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  userName!,
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
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
