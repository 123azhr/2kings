import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:housecontractors/Screens/profile/profile_view.dart';
import 'package:housecontractors/helper/size_configuration.dart';

import '../../../components/profile_header.dart';
import '../../Chat/Inbox.dart';

class WorkerTile extends StatelessWidget {
  WorkerTile(
      {super.key,
      required this.serviceName,
      required this.rating,
      required this.workerName});
  final String serviceName;
  final String workerName;
  final double rating;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => worker_tile_details(context),
      leading: Image.asset(
        "assets/images/KingContractor.jpg",
        fit: BoxFit.contain,
      ),
      // Image.asset('KingContractor.jpg', fit: BoxFit.fill),
      title: Text(workerName),
      subtitle: Row(
        children: [
          RatingBar.builder(
            initialRating: rating,
            minRating: 0,
            maxRating: 5,
            itemBuilder: ((context, _) => const Icon(
                  Icons.star,
                  color: Colors.lightBlueAccent,
                )),
            ignoreGestures: true,
            onRatingUpdate: (newRatingValue) {},
            updateOnDrag: false,
            allowHalfRating: true,
            glow: false,
            itemCount: 5,
            itemSize: getProportionateScreenHeight(15),
            textDirection: TextDirection.ltr,
          ),
          Text("$rating"),
        ],
      ),
    );
  }

  Future<dynamic> worker_tile_details(BuildContext context) {
    return showModalBottomSheet(
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
          height: setHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        getProportionateScreenWidth(20),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "About $serviceName",
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: ProfileHeader(title: workerName),
                ),
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
                    itemBuilder: (context, index) => Text("services"),
                  ),
                ),
                Divider(
                  thickness: 0.2,
                  height: getProportionateScreenHeight(10),
                  color: Colors.black,
                ),
                Text(
                  "Bio: ",
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(15),
                  ),
                ),
                SizedBox(
                  height: setHeight(20),
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
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProfileView(title: workerName),
                              ),
                            );
                          },
                          child: Text(
                            "Profile View",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: getProportionateScreenHeight(18),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: setHeight(5),
                        width: setWidth(30),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.amberAccent,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Inbox(title: workerName),
                              ),
                            );
                          },
                          child: Text(
                            "Chat",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: getProportionateScreenHeight(18),
                                fontWeight: FontWeight.bold),
                          ),
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
    );
  }
}
