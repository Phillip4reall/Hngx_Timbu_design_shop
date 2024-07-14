// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Customfield extends StatelessWidget {
  final text;
  const Customfield({
    this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        decoration: InputDecoration(
            hintStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
            hintText: text,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
