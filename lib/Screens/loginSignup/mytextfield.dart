import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    this.hintText = "",
    this.height,
    required this.width,
    this.color,
    required this.radius,
  }) : super(key: key);
  final String? hintText;
  final double? height;
  final double width;
  final Color? color;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          fillColor: (color != null) ? color : Colors.white,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
      ),
    );
  }
}
