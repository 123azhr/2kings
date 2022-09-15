import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Workers extends StatelessWidget {
  Workers({Key? key}) : super(key: key);
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
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Plumber",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Plumber",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "Welder",
              onTap: () {},
            ),
            WorkerTile(
              assetImagePath: 'assets/images/logo-black-half.png',
              title: "AC Service",
              onTap: () {},
            ),
          ],
        ));
  }
}

class WorkerTile extends StatelessWidget {
  final String? _assetImagePath, _title;
  final void Function()? _onTap;

  const WorkerTile(
      {Key? key, String? assetImagePath, String? title, void Function()? onTap})
      : _assetImagePath = assetImagePath,
        _title = title,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(getProportionateScreenWidth(20)))),
      child: GestureDetector(
        onTap: _onTap,
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
