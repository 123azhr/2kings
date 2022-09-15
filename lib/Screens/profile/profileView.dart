import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/newsfeed/components/post.dart';
import 'package:housecontractors/Screens/profile/profileHeader.dart';
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
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
            title: TextFormField(style: TextStyle(fontSize: 20)),
            actions: [
              GestureDetector(
                child: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            ]),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: 800,
            child: ListView(
              children: [
                ProfileHeader(),
                Divider(
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenHeight(5.0)),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(5.0)),
                    child: Text("Services"),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  height: getProportionateScreenHeight(80),
                  padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: getProportionateScreenWidth(0),
                        mainAxisSpacing: getProportionateScreenHeight(0),
                        mainAxisExtent: getProportionateScreenHeight(20),
                        childAspectRatio: 150 / 220),
                    itemCount: 10,
                    itemBuilder: (context, index) => const Text("electrician"),
                    shrinkWrap: true,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(520),
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, int index) => Post(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
