import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {this.hintText = "",
      this.height = 65,
      required this.width,
      this.color,
      this.leading,
      required this.radius,
      required this.controller})
      : super();

  final String? hintText;
  final double? height;
  final double width;
  final Color? color;
  final Widget? leading;
  final double radius;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontSize: 18,
      ),
      scrollPhysics: ScrollPhysics(),
      decoration: InputDecoration(
        constraints: BoxConstraints(
          minWidth: width,
          maxWidth: width,
        ),
        suffixIcon: leading,
        fillColor: (color != null) ? color : Colors.white,
        filled: true,
        isCollapsed: true,
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(12, height! / 3, 12, height! / 3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ),
      ),
    );
  }
}
