import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class Workers extends StatelessWidget {
  const Workers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(400),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 150 / 220,
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
    return GestureDetector(
      onTap: _onTap,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(getProportionateScreenWidth(20)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(120),
              child: Image(
                image: AssetImage(_assetImagePath!),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: getProportionateScreenHeight(5)),
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
