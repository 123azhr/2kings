import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Column(children: [
        ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/logo-black-half.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          title: TextField(),
          trailing: Icon(
            Icons.search_rounded,
          ),
        ),
      ])),
    );
  }
}
