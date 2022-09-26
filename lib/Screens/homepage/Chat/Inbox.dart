import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/widgets/mycontainer.dart';

import '../../../helper/size_configuration.dart';
import '../../../widgets/myAppBar.dart';
import 'messages.dart';

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
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
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
      body: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: 180),
          child: Messages(text: "hellow"),
        ),
        reverse: true,
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
