import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/workers/worker_tile_details.dart';
import 'package:housecontractors/Screens/orders/logs.dart';
import 'package:housecontractors/Screens/profile/profile_header.dart';
import 'package:housecontractors/helper/size_configuration.dart';

import '../../../widgets/bottom_modal_sheet.dart';

class WorkerTile extends StatelessWidget {
  WorkerTile({super.key, required this.title});
  final String title;
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => showModalBottomSheet(
        context: context,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        builder: (context) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                getProportionateScreenWidth(20),
              ),
            ),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            height: setHeight(70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(title: title),
                Divider(
                  thickness: 0.2,
                  height: 0,
                  color: Colors.black,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(7),
                ),
                Text(
                  "Services",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(20),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  height: getProportionateScreenHeight(10),
                  color: Colors.black,
                ),
                Container(
                  height: setHeight(7),
                  color: Color.fromARGB(255, 255, 255, 255),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: getProportionateScreenWidth(0),
                        mainAxisSpacing: getProportionateScreenHeight(0),
                        mainAxisExtent: getProportionateScreenHeight(20),
                        childAspectRatio: 150 / 220),
                    itemCount: 9,
                    itemBuilder: (context, index) => const Text("electrician"),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  height: getProportionateScreenHeight(10),
                  color: Colors.black,
                ),
                SizedBox(
                  height: setHeight(25),
                ),
                Divider(
                  thickness: 0.2,
                  height: getProportionateScreenHeight(10),
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Row(
                    children: [
                      Container(
                        height: setHeight(5),
                        width: setWidth(30),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Profile View"),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: setHeight(5),
                        width: setWidth(30),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("Chat"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      leading: Image.asset(
        "assets/images/KingContractor.jpg",
        fit: BoxFit.contain,
      ),
      // Image.asset('KingContractor.jpg', fit: BoxFit.fill),
      title: Text("Worker Name"),
      subtitle: Text("3.8"),
    );
  }
}
