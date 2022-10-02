import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import '../../helper/size_configuration.dart';
import 'my_messages.dart';
import 'opposite_messages.dart';

class Inbox extends StatelessWidget {
  Inbox({super.key, required this.title});
  final String title;
  TextEditingController _textController = TextEditingController();
  TextEditingController _offertextController = TextEditingController();
  TextEditingController _servicetextController = TextEditingController();
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
                  text: _textController.text,
                ),
          reverse: true,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BottomAppBar(
          child: Container(
            height: setHeight(14),
            color: Color.fromARGB(255, 239, 203, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.lightBlue,
                  height: setHeight(7),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Center(
                            child: Text(
                          "Service: ",
                          style: TextStyle(fontSize: 20),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 10),
                        child: MyTextField(
                          width: setWidth(40),
                          height: setHeight(7 / 1.5),
                          radius: 20,
                          controller: _servicetextController,
                          hintText: "Enter service name",
                          leading: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.send),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Center(
                            child: Text(
                          "Offer: ",
                          style: TextStyle(fontSize: 20),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 10),
                        child: MyTextField(
                          width: setWidth(25),
                          height: setHeight(7 / 1.5),
                          radius: 20,
                          controller: _offertextController,
                          hintText: "Enter service name",
                          leading: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 10),
                      child: MyTextField(
                        width: setWidth(75),
                        height: setHeight(7 / 1.5),
                        radius: 20,
                        controller: _textController,
                        hintText: "Message",
                        leading: GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.send),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
