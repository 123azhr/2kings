import 'package:flutter/material.dart';

import 'package:housecontractors/components/workers/workers_list.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class HomeServices extends StatelessWidget {
  HomeServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: setHeight(30),
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: getProportionateScreenWidth(0),
            mainAxisSpacing: getProportionateScreenHeight(0),
            mainAxisExtent: setHeight(15),
          ),
          shrinkWrap: true,
          children: [
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Plumber",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Plumber",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
            ),
          ],
        ));
  }
}

class WorkerSlide extends StatelessWidget {
  final String assetImagePath, title;
  const WorkerSlide({
    Key? key,
    required this.title,
    required this.assetImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                WorkersList(workerName: "Arsalan", serviceName: title),
          )),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(70),
              child: Image(
                image: AssetImage(assetImagePath),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenHeight(17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
