import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/model.dart/cartmodel.dart';

import 'sreens/mainscreen.dart';

void main() {
  runApp(const MyApp());
}

List<Additems> cartItems = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const Checkout(),
      home: const MainScreen(),
    );
  }
}
