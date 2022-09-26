import 'package:flutter/material.dart';

class SearchHome extends StatelessWidget {
  SearchHome({super.key});
  TextEditingController _searchController = TextEditingController();
  _searchPeople(TextEditingController search) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: TextFormField(
            style: TextStyle(fontSize: 20), controller: _searchController),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              _searchPeople(_searchController);
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
          itemCount: 1,
          itemBuilder: (context, index) {
            return SearchTile();
          }),
    );
  }
}

class SearchTile extends StatelessWidget {
  const SearchTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Areeb Uz Zaman"),
      subtitle: Text("Lorem Ipsum check Lorem ipsum check"),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        ),
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
