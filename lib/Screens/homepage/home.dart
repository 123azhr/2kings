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
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(10)),
        ListTile(
          visualDensity: VisualDensity(horizontal: 4, vertical: -4),
          leading: Image.asset(
            "assets/images/logo-black-half.png",
            fit: BoxFit.fitWidth,
          ),
          title: Text("Home"),
          trailing: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            icon: Icon(
              Icons.search_rounded,
            ),
          ),
        ),
        const Divider(
          height: 20,
          thickness: 0.2,
          indent: 0,
          endIndent: 0,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 8,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: [
                SizedBox(height: getProportionateScreenHeight(10)),
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
                Stories(),
                Divider(
                  height: getProportionateScreenHeight(20),
                  thickness: 0.05,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                Text(
                  "Workers",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Divider(
                  height: getProportionateScreenHeight(20),
                  thickness: 0.05,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                const Workers(),
                Divider(
                  height: getProportionateScreenHeight(20),
                  thickness: 0.05,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
              ]),
        ),
      ],
    );
  }
}
/*
      color: Theme.of(context).colorScheme.background,
      child: Image.asset('assets/images/logo-black-full.png',
          fit: BoxFit.scaleDown),
          */
