import 'package:flutter/material.dart';
import 'package:housecontractors/components/workers/Worker_list_tile.dart';
import 'package:housecontractors/components/workers/add_workers.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../providers/worker_provider.dart';

class WorkersList extends StatelessWidget {
  WorkersList({super.key, required this.serviceName});
  final String serviceName;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final workerProvider = Provider.of<WorkerProvider>(context);
    final workerList = workerProvider.getList;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          serviceName,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
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
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: workerList.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, int index) => ChangeNotifierProvider.value(
                value: workerList[index],
                child: WorkerTile(
                  serviceName: serviceName,
                ),
              )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.scale,
                alignment: Alignment.bottomRight,
                child: AddWorker(title: serviceName),
                duration: const Duration(milliseconds: 550),
                inheritTheme: true,
                ctx: context),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This,
    );
  }
}
