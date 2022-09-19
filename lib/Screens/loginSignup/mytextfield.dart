import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {this.hintText = "",
      this.height,
      required this.width,
      this.color,
      this.icon,
      required this.radius,
      required this.controller})
      : super();

  final String? hintText;
  final double? height;
  final double width;
  final Color? color;
  final IconData? icon;
  final double radius;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: Icon(
            icon,
          ),
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
