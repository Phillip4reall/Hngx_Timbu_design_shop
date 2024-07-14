import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/utils/textfont.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          'User Profile',
          style: textfont(25, FontWeight.bold, Colors.black),
        ),
      )),
    );
  }
}
