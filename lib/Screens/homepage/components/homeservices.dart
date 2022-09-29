import 'package:flutter/material.dart';
import 'package:housecontractors/Screens/homepage/workers/workers_list.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class HomeServices extends StatelessWidget {
  HomeServices({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(250),
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: getProportionateScreenWidth(0),
            mainAxisSpacing: getProportionateScreenHeight(0),
            mainAxisExtent: getProportionateScreenHeight(120),
          ),
          shrinkWrap: true,
          children: [
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Plumber",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Plumber",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
              onTap: () {},
            ),
            WorkerSlide(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
              onTap: () {},
            ),
          ],
        ));
  }
}

class WorkerSlide extends StatelessWidget {
  final String? _assetImagePath, _title;

  const WorkerSlide(
      {Key? key, String? assetImagePath, String? title, void Function()? onTap})
      : _assetImagePath = assetImagePath,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkersList(),
          )),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(20)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(70),
              child: Image(
                image: AssetImage(_assetImagePath!),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
              child: Text(
                _title!,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenWidth(17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
