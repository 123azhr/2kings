import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/newsfeed/components/post.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
            title: TextFormField(),
            actions: [
              GestureDetector(
                child: Icon(
                  Icons.search_rounded,
                ),
                onTap: () {},
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileHeader(),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.all(getProportionateScreenHeight(5.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text("Services"),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Container(
                height: getProportionateScreenHeight(80),
                padding: EdgeInsets.all(8),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: getProportionateScreenWidth(0),
                      mainAxisSpacing: getProportionateScreenHeight(0),
                      mainAxisExtent: getProportionateScreenHeight(20),
                      childAspectRatio: 150 / 220),
                  itemCount: 10,
                  itemBuilder: (context, index) => Text("Electrician"),
                  shrinkWrap: true,
                ),
              ),
              Container(
                height: getProportionateScreenHeight(580),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) => Post(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class profileHeader extends StatelessWidget {
  const profileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: getProportionateScreenHeight(60),
          width: getProportionateScreenWidth(60),
          child: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                fit: BoxFit.fill,
                height: getProportionateScreenHeight(80),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Muhammad Azhar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "email@example.com",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "4.5",
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ]),
    );
  }
}
// SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(getProportionateScreenWidth(10.0)),
//                 child:
//                     Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//                   SizedBox(
//                     height: 80,
//                     width: 80,
//                     child: CircleAvatar(
//                       child: ClipOval(
//                         child: Image.network(
//                           "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
//                           fit: BoxFit.fill,
//                           height: 100,
//                           width: 100,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(left: getProportionateScreenWidth(15)),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Muhammad Azhar",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.w500),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "email@example.com",
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "4.5",
//                         textAlign: TextAlign.right,
//                       ),
//                     ],
//                   ),
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );