import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/components/search.dart';
import 'package:housecontractors/Screens/homepage/components/workers.dart';
import 'package:housecontractors/Screens/homepage/components/stories.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/images/logo-black-half.png",
          fit: BoxFit.fitWidth,
        ),
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            icon: const Icon(
              Icons.search_rounded,
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
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
                  SizedBox(height: getProportionateScreenHeight(0)),
                  Text(
                    "Stories",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Divider(
                    height: getProportionateScreenHeight(20),
                    thickness: 0.1,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  const Stories(),
                  Divider(
                    height: getProportionateScreenHeight(20),
                    thickness: 0.05,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  Text(
                    "Home Services",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Divider(
                    height: getProportionateScreenHeight(20),
                    thickness: 0.05,
                    indent: 0,
                    endIndent: 0,
                    color: Colors.black,
                  ),
                  Workers(),
                  Card(
                    child: Container(
                      height: getProportionateScreenHeight(160),
                      width: getProportionateScreenWidth(500),
                      child: const Text("Hire a Contractor"),
                      padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getProportionateScreenWidth(20)))),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
