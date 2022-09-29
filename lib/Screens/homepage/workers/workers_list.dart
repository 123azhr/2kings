import 'package:flutter/material.dart';
import 'Worker_list_tile.dart';

class WorkersList extends StatefulWidget {
  const WorkersList(
      {super.key, required this.workerName, required this.serviceName});
  final String workerName;
  final String serviceName;
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
                widget.serviceName,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
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
            return Column(
              children: [
                WorkerTile(
                  rating: 5,
                  serviceName: widget.serviceName,
                  workerName: widget.workerName,
                ),
                Divider(
                  thickness: 0.2,
                  color: Colors.black,
                )
              ],
            );
          } else {
            return WorkerTile(
              serviceName: widget.serviceName,
              workerName: widget.workerName,
              rating: 5,
            );
          }
        },
      ),
    );
  }
}
