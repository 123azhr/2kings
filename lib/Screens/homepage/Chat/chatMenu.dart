import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/Chat/Inbox.dart';
import 'package:housecontractors/widgets/myAppBar.dart';

class chatMenu extends StatefulWidget {
  const chatMenu({super.key});

  @override
  State<chatMenu> createState() => _chatMenuState();
}

class _chatMenuState extends State<chatMenu> {
  bool isClicked = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isClicked
          ? AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: TextFormField(
                  style: TextStyle(fontSize: 20),
                  controller: _searchController),
              leading: IconButton(
                color: Colors.black,
                onPressed: () {
                  setState(() {
                    isClicked = false;
                  });
                },
                icon: const Icon(
                  Icons.arrow_back,
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
              elevation: 0,
              backgroundColor: Colors.transparent,
            )
          : AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "Chats",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: (kToolbarHeight / 100) * 40,
                ),
              ),
              actions: [
                IconButton(
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      isClicked = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
      body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return chatMenuTile();
          }),
    );
  }
}

class chatMenuTile extends StatelessWidget {
  const chatMenuTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Areeb Uz Zaman"),
      subtitle: Text("Last Message"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ),
      ),
      trailing: PopupMenuButton(itemBuilder: (context) {
        return [
          PopupMenuItem<int>(
            value: 0,
            child: Text("Delete this chat"),
          ),
          PopupMenuItem<int>(
            value: 1,
            child: Text("Turn off notification "),
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
      onTap: () => Inbox(title: "Hassam Nusrat"),
    );
  }
}
