import 'package:flutter/material.dart';
import 'package:housecontractors/widgets/mycontainer.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/components/Post/post.dart';

import '../../helper/size_configuration.dart';

class Newsfeed extends StatelessWidget {
  Newsfeed({Key? key}) : super(key: key);
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    TextEditingController _postController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.fitWidth,
        ),
        title: GestureDetector(
          onTap: () {
            _scrollController.jumpTo(0);
          },
          child: Text(
            "Newsfeed",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(20),
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    "https://images.pexels.com/photos/1172253/pexels-photo-1172253.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    fit: BoxFit.fill,
                    height: getProportionateScreenHeight(80),
                  ),
                ),
              ),
              title: MyTextField(
                  hintText: "Share your skills",
                  height: 40,
                  width: 100,
                  radius: 20,
                  controller: _postController),
              trailing: const Icon(
                Icons.image_rounded,
                size: 30,
              ),
            ),
            SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, int index) => Post(title: "Haziq Ahmed"),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
