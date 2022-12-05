import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Chat/fill_aggrement_form.dart';
import 'package:housecontractors/Screens/Chat/aggrement_message.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/models/user_model.dart';
import 'package:housecontractors/providers/message_provider.dart';
import 'package:provider/provider.dart';
import '../../helper/size_configuration.dart';
import '../../models/chat_model.dart';
import '../../providers/current_user_provider.dart';
import 'my_messages.dart';
import 'opposite_messages.dart';

class Inbox extends StatefulWidget {
  const Inbox({super.key, required this.user, required this.chat});
  final UserModel user;
  final ChatModel chat;

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  final TextEditingController _textController = TextEditingController();

  // final TextEditingController _offertextController = TextEditingController();

  // final TextEditingController _servicetextController = TextEditingController();

  final bool isOpposite = true;

  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<MessageProvider>(context);
    final messageList = messageProvider.getSortedList();

    final userProvider = Provider.of<CurrentUserProvider>(context);
    final loggedinUser = userProvider.getCurrentUser();

    // String selectedValue = "Services";
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Services"), value: "Services"),
    ];
    for (int index = 0; index < loggedinUser.services!.length; index++) {
      menuItems.add(DropdownMenuItem(
        child: Text(loggedinUser.services!.elementAt(index)),
        value: loggedinUser.services!.elementAt(index),
      ));
    }
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "${widget.user.name}",
            style: const TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {},
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          reverse: true,
          separatorBuilder: (context, index) => SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          scrollDirection: Axis.vertical,
          itemCount: messageList.length,
          itemBuilder: (context, int index) => ChangeNotifierProvider.value(
              value: messageList[index],
              child: messageList[index].aggrementID == ""
                  ? messageList[index].type!
                      ? MyMessages(
                          text: messageList[index].messageTxt!,
                        )
                      : OppositeMessages(text: messageList[index].messageTxt!)
                  : AggrementMsg(text: messageList[index].aggrementID!)),
          physics: const BouncingScrollPhysics(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BottomAppBar(
          child: Container(
            height: setHeight(15),
            color: const Color.fromARGB(255, 239, 203, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Color.fromARGB(255, 251, 237, 105),
                  height: setHeight(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FillAggrement(
                                      customerID: widget.user.userID!),
                                ));
                          },
                          child: const Text("Generate Aggrement"))
                     
                    ],
                  ),
                ),
                SizedBox(
                  height: setHeight(8),
                  child: Row(
                    children: [
                      SizedBox(
                        height: setHeight(7),
                        width: setWidth(10),
                        child: const Icon(Icons.camera_alt),
                      ),
                      SizedBox(
                        height: setHeight(7),
                        width: setWidth(14),
                        child: const Icon(Icons.image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 10),
                        child: MyTextField(
                          width: setWidth(70),
                          height: setHeight(3),
                          radius: 20,
                          controller: _textController,
                          hintText: "Message",
                          leading: GestureDetector(
                            onTap: () {
                              if (_textController.text.isNotEmpty) {
                                messageProvider.uploadMessageDataToFireStore(
                                    chatWith: widget.user.userID,
                                    createdAt: DateTime.now(),
                                    messagetxt: _textController.text,
                                    aggrementID: "",
                                    type: true);
                                _textController.clear();
                                messageProvider.fetch();
                              }
                            },
                            child: const Icon(Icons.send),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
