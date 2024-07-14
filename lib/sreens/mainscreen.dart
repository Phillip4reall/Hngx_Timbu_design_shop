import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/sreens/checkout.dart';
import 'package:hngx_timbu_shop/sreens/mycart.dart';
import 'package:hngx_timbu_shop/sreens/profile.dart';

import 'home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = const [HomePage(), Checkout(), Products(), Profile()];
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.lightBlue,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          currentIndex: pageindex,
          onTap: (index) {
            setState(() {
              pageindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Product'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: 'Checkout'),
            BottomNavigationBarItem(
                icon: Icon(Icons.online_prediction_rounded),
                label: 'My orders'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile'),
          ]),
      body: pages[pageindex],
    );
  }
}
