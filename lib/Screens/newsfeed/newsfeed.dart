import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/loginSignup/mytextfield.dart';
import 'package:housecontractors/Screens/newsfeed/create_post.dart';
import 'package:housecontractors/components/Post/post.dart';
import 'package:housecontractors/providers/post_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../helper/size_configuration.dart';

class Newsfeed extends StatelessWidget {
  Newsfeed({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    TextEditingController _postController = TextEditingController();
    final postProvider = Provider.of<PostProvider>(context);
    final postsList = postProvider.getList;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenWidth(40),
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.contain,
        ),
        title: GestureDetector(
          onTap: () {
            _scrollController.initialScrollOffset;
          },
          child: const Text(
            "Newsfeed",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        bottom: PreferredSize(
          preferredSize: Size(setWidth(100), setHeight(7)),
          child: ListTile(
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
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: const CreatePost(),
                      duration: const Duration(milliseconds: 300),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              icon: Icon(
                color: Color.fromARGB(255, 87, 87, 87),
                Icons.image_rounded,
                size: 30,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: postsList.length,
        itemBuilder: (context, int index) => ChangeNotifierProvider.value(
          value: postsList[index], 
          child: Post(title: ""),
        ),
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
