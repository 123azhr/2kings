import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/components/homeservices.dart';
import 'package:housecontractors/Screens/homepage/components/story/stories.dart';
import 'package:housecontractors/Screens/homepage/components/searchHome.dart';
import 'package:housecontractors/helper/size_configuration.dart';
import 'package:page_transition/page_transition.dart';
import 'components/construction_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenWidth(40),
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.contain,
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: (kToolbarHeight / 100) * 40,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeftWithFade,
                  child: SearchHome(),
                  isIos: true,
                  duration: const Duration(milliseconds: 400),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        centerTitle: true,
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 2,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.ltr,
                  children: [
                    Text(
                      "Stories",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Divider(
                      height: getProportionateScreenHeight(20),
                      thickness: getProportionateScreenHeight(0.1),
                      color: Colors.black,
                    ),
                    const Stories(),
                    Divider(
                      height: getProportionateScreenHeight(20),
                      thickness: getProportionateScreenHeight(0.05),
                      color: Colors.black,
                    ),
                    Text(
                      "Home Services",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Divider(
                      height: getProportionateScreenHeight(20),
                      thickness: getProportionateScreenHeight(0.05),
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    const HomeServices(),
                    Divider(
                      height: getProportionateScreenHeight(20),
                      thickness: getProportionateScreenHeight(0.1),
                      color: Colors.black,
                    ),
                    Text(
                      "Construction Services",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Divider(
                      height: getProportionateScreenHeight(20),
                      thickness: getProportionateScreenHeight(0.05),
                      indent: 0,
                      endIndent: 0,
                      color: Colors.black,
                    ),
                    const ConstructionServices(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
