import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/utils/textfont.dart';

// ignore: must_be_immutable
class Category extends StatelessWidget {
  String text;
  IconData? icon;
  Category({
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade100, shape: BoxShape.circle),
          child: Icon(icon),
        ),
        Text(
          text,
          style: textfont(15, FontWeight.bold, Colors.black),
        ),
      ],
    );
  }
}
