import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:provider/provider.dart';
import '../../../../models/workers_model.dart';

class WorkerTile extends StatelessWidget {
  const WorkerTile({super.key, required this.serviceName});
  final String serviceName;

  @override
  Widget build(BuildContext context) {
    final workerModel = Provider.of<WorkerModel>(context);
    return ListTile(
      onTap: () => worker_tile_details(context, workerModel),
      leading: SizedBox(
        height: 50,
        width: 50,
        child: CachedNetworkImage(
          imageUrl: workerModel.profileImg!,
        ),
      ),
      title: Text(workerModel.name!),
    );
  }

  Future<dynamic> worker_tile_details(
      BuildContext context, WorkerModel workerModel) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            height: setHeight(59),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: setHeight(1)),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(102, 243, 215, 33),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  height: setHeight(5),
                  width: setWidth(85),
                  child: Center(
                    child: Text(
                      "About " + workerModel.name!,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(20),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                    height: setHeight(53),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Image.network(workerModel.profileImg!),
                        Text(
                          "Email: " + workerModel.email!,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        Text(
                          "CNIC: " + workerModel.cnic!,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        Text(
                          "Experience: " + workerModel.experience!,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        Text(
                          "Gender: " +
                              (workerModel.gender! ? "Male" : "Female"),
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        Text(
                          "Contact: " + workerModel.number!,
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        Text(
                          "Status: " + workerModel.status.toString(),
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black,
                          height: 0,
                        ),
                        Text(
                          "Bio: ",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                          ),
                        ),
                        const Divider(
                          thickness: 0.2,
                          color: Colors.black,
                          height: 0,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Container(
//           color: Colors.blue,
//           height: setHeight(60),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.amberAccent,
//                     borderRadius: BorderRadius.all(
//                       Radius.circular(
//                         20,
//                       ),
//                     ),
//                   ),
//                   child: Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         "About $serviceName ",
//                         style: TextStyle(
//                             fontSize: getProportionateScreenHeight(20),
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SingleChildScrollView(
//                   child: Container(
//                     height: setHeight(20),
//                     child: Column(
//                       children: [
//                         Container(
//                           height: setHeight(10),
//                           child: Padding(
//                             padding: EdgeInsets.fromLTRB(
//                                 0,
//                                 getProportionateScreenHeight(10),
//                                 0,
//                                 getProportionateScreenHeight(0)),
//                             child: ProfileHeader(title: workerName),
//                           ),
//                         ),
//                         Divider(
//                           thickness: 0.2,
//                           height: setHeight(1),
//                           color: Colors.black,
//                         ),
//                         Text(
//                           "Services",
//                           style: TextStyle(
//                             fontSize: getProportionateScreenHeight(20),
//                           ),
//                         ),
//                         Divider(
//                           thickness: 0.2,
//                           color: Colors.black,
//                         ),
//                         Container(
//                           height: setHeight(9),
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           child: GridView.builder(
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3,
//                               crossAxisSpacing: getProportionateScreenWidth(0),
//                               mainAxisSpacing: getProportionateScreenHeight(0),
//                               mainAxisExtent: getProportionateScreenHeight(20),
//                               childAspectRatio: 150 / 220,
//                             ),
//                             itemCount: 9,
//                             itemBuilder: (context, index) => Text("services"),
//                           ),
//                         ),
//                         Divider(
//                           thickness: 0.2,
//                           color: Colors.black,
//                         ),
//                         Text(
//                           "Bio: ",
//                           style: TextStyle(
//                             fontSize: getProportionateScreenHeight(20),
//                           ),
//                         ),
//                         Divider(
//                           thickness: 0.2,
//                           color: Colors.black,
//                         ),
//                         SizedBox(
//                           height: setHeight(5),
//                         ),
//                         Divider(
//                           thickness: 0.2,
//                           color: Colors.black,
//                         ),
//                         Container(
//                           color: Colors.yellow,
//                           padding: EdgeInsets.only(
//                             bottom: MediaQuery.of(context).viewInsets.bottom,
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: setHeight(7),
//                                 width: setWidth(30),
//                                 child: ElevatedButton(
//                                   style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                       Colors.amberAccent,
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             ProfileView(title: workerName),
//                                       ),
//                                     );
//                                   },
//                                   child: Text(
//                                     "Profile View",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontSize:
//                                             getProportionateScreenHeight(18),
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                               Spacer(),
//                               Container(
//                                 height: setHeight(7),
//                                 width: setWidth(30),
//                                 child: ElevatedButton(
//                                   style: ButtonStyle(
//                                     backgroundColor:
//                                         MaterialStateProperty.all<Color>(
//                                       Colors.amberAccent,
//                                     ),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             Inbox(title: workerName),
//                                       ),
//                                     );
//                                   },
//                                   child: Text(
//                                     "Chat",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontSize:
//                                             getProportionateScreenHeight(18),
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Spacer(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
