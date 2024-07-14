import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/main.dart';
import 'package:hngx_timbu_shop/sreens/mainscreen.dart';
import 'package:hngx_timbu_shop/utils/button.dart';
import 'package:hngx_timbu_shop/utils/textfont.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: Colors.green, shape: BoxShape.circle),
                child: const Icon(
                  Icons.check,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                'Payment successful',
                style: textfont(20, FontWeight.bold, Colors.black),
              ),
              Text(
                maxLines: 2,
                'You have successfully placed an order. Details of your order has been sent to your email.',
                style: textfont(15, FontWeight.normal, Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                  onTap: () {
                    cartItems.clear();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  text: 'Okay')
            ],
          ),
        ),
      ),
    );
  }
}
