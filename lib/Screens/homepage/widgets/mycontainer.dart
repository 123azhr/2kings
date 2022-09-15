import 'package:flutter/material.dart';
import 'package:housecontractors/helper/size_configuration.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({
    Key? key,
    this.image,
    required this.height,
    required this.width,
    this.child,
    this.color,
  }) : super(key: key);
  final ImageProvider? image;
  final double height;
  final double width;
  final Widget? child;
  final Color? color;
  ImageProvider imageFunc(ImageProvider? img) {
    if (img != null) {
      return img;
    } else {
      return const AssetImage("assets/images/logo-white-full.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(getProportionateScreenWidth(20)))),
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: (color != null) ? Colors.white : color,
            image: DecorationImage(
              image: imageFunc(image),
            ),
            border: Border.all(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: child),
    );
  }
}
/*Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Add Story"),
            Icon(Icons.add_circle),
          ],
        )); */