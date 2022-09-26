import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/widgets/mycontainer.dart';

import '../../../helper/size_configuration.dart';
import '../../../widgets/myAppBar.dart';
import 'myMessages.dart';
import 'oppositeMessages.dart';

class Inbox extends StatelessWidget {
  Inbox({super.key, required this.title});
  final String title;
  TextEditingController _textController = TextEditingController();
  final bool isOpposite = true;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "$title",
            style: TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.call),
              onPressed: () {},
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => isOpposite
              ? OppositeMessages(
                  text: "hello ",
                )
              : MyMessages(
                  text: "hello946354351318315313581",
                ),
          reverse: true,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BottomAppBar(
          child: Row(
            children: [
              Container(
                height: setHeight(7),
                width: setWidth(10),
                child: Icon(Icons.camera_alt),
              ),
              Container(
                height: setHeight(7),
                width: setWidth(10),
                child: Icon(Icons.image),
              ),
              MyTextField(
                width: setWidth(65),
                height: setHeight(7 / 1.5),
                radius: 20,
                controller: _textController,
                hintText: "Message",
              ),
              Container(
                height: setHeight(7),
                width: setWidth(15),
                child: Icon(Icons.thumb_up),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
