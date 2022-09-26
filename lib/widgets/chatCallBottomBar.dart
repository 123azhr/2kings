import 'package:flutter/material.dart';

import '../Screens/homepage/Chat/chatMenu.dart';
import '../helper/size_configuration.dart';

class bottomCallChat extends StatelessWidget {
  const bottomCallChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          Container(
            height: 50,
            width: getProportionateScreenWidth(375 / 2),
            color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.call),
                Text("Call"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => chatMenu()),
            ),
            child: Container(
              height: 50,
              width: getProportionateScreenWidth(375 / 2),
              color: Color.fromARGB(255, 172, 255, 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat),
                  Text("Chat"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
