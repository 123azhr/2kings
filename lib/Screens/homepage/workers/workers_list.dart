import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'Worker_list_tile.dart';

class WorkersList extends StatefulWidget {
  const WorkersList({super.key});

  @override
  State<WorkersList> createState() => _WorkersListState();
}

class _WorkersListState extends State<WorkersList> {
  bool isShowAll = true;
  bool isClicked = false;

  TextEditingController _searchController = TextEditingController();

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
                "Electrician",
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
        itemCount: 12,
        itemBuilder: (context, index) {
          if (isShowAll) {
            return WorkerTile(
              title: "Electrician Name",
            );
          } else {
            return WorkerTile(title: "Electrician Name");
          }
        },
      ),
    );
  }
}
