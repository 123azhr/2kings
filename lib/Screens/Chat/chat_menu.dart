
import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/Chat/inbox.dart';
import 'package:housecontractors/models/user_model.dart';
import 'package:provider/provider.dart';

import '../../helper/size_configuration.dart';
import '../../models/chat_model.dart';
import '../../providers/chat_provider.dart';
import '../../providers/user_provider.dart';

class ChatMenu extends StatefulWidget {
  const ChatMenu({super.key});

  @override
  State<ChatMenu> createState() => _ChatMenuState();
}

class _ChatMenuState extends State<ChatMenu> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);
    final chatList = chatProvider.getList;
    final userProvider = Provider.of<UserProvider>(context);
    // final user = userProvider.getUserByID(chatList[index].otherID);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenWidth(40),
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.contain,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Chats",
          style: TextStyle(
            color: Colors.black,
            fontSize: (kToolbarHeight / 100) * 40,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: chatList.length,
        itemBuilder: (context, int index) => ChangeNotifierProvider.value(
          value: chatList[index],
          child:  ChatMenuTile(
            chat: chatList[index],
            subtitle: userProvider
                .getUserByID(chatList[index].otherID!)
                .services!
                .first,
            user: userProvider.getUserByID(chatList[index].otherID!),
            image: NetworkImage(userProvider
                .getUserByID(chatList[index].otherID!)
                .profileImageURL!),
          ),
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

class ChatMenuTile extends StatelessWidget {
  const ChatMenuTile({
    Key? key,
    required this.user,
    required this.subtitle,
    this.image,
    required this.chat,
  }) : super(key: key);
  final UserModel user;

  final ChatModel chat;
  final String subtitle;
  final ImageProvider<Object>? image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Inbox(user: user, chat: chat)),
        );
      },
      title: Text(user.name!),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        backgroundImage: const AssetImage(
          "assets/images/logo-black-half.png",
        ),
        foregroundImage: image,
      ),
      trailing: PopupMenuButton(itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Text("Remove this notification"),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text("Turn off notification about this."),
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
    );
  }
}
