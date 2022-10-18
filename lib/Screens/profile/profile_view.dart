import 'package:flutter/material.dart';
import 'package:housecontractors/components/Post/post.dart';
import 'package:housecontractors/components/profile_header.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:provider/provider.dart';

import '../../providers/post_provider.dart';
import '../../widgets/chat_call_bottom_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);
    final postsList = postProvider.getList;
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: (kToolbarHeight / 100) * 40,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(5.0)),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            scrollDirection: Axis.vertical,
            child: SizedBox(
              height: 800,
              child: ListView(
                children: [
                  ProfileHeader(title: title),
                  Divider(
                    thickness: 1,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(5.0)),
                    child: Text("Services"),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  Container(
                    height: getProportionateScreenHeight(80),
                    padding: EdgeInsets.all(getProportionateScreenHeight(8)),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: getProportionateScreenWidth(0),
                          mainAxisSpacing: getProportionateScreenHeight(0),
                          mainAxisExtent: getProportionateScreenHeight(20),
                          childAspectRatio: 150 / 220),
                      itemCount: 9,
                      itemBuilder: (context, index) =>
                          const Text("electrician"),
                    ),
                  ),
                  ListView.builder(
                    itemCount: postsList.length,
                    itemBuilder: (context, int index) =>
                        ChangeNotifierProvider.value(
                      value: postsList[index],
                      child: Post(title: ""),
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  SizedBox(
                    height: 65,
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomCallChat(),
      ),
    );
  }
}
