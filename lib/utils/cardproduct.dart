// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/model.dart/cartmodel.dart';

import '../main.dart';
import '../model.dart/productmodel.dart';
import 'button.dart';
import 'textfont.dart';

class Cardproduct extends StatefulWidget {
  Product product;
  Cardproduct({
    required this.product,
    super.key,
  });

  @override
  State<Cardproduct> createState() => _CardproductState();
}

class _CardproductState extends State<Cardproduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.lightBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            widget.product.photos[0],
            width: 120,
            height: 200,
          ),
          // const Spacer(),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.product.name,
                style: textfont(15, FontWeight.normal, Colors.white),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '',
                    style: textfont(15, FontWeight.normal, Colors.white),
                  ),
                  Text(
                    '',
                    style: textfont(15, FontWeight.normal, Colors.white),
                  ),
                  Text(
                    widget.product.currentPrice,
                    style: textfont(18, FontWeight.normal, Colors.white),
                  ),
                ],
              ),
              Button(
                width: 100,
                height: 30,
                text: 'Add to cart',
                onTap: () {
                  Additems product = Additems(
                    name: widget.product.name,
                    // ignore: collection_methods_unrelated_type
                    price: widget.product.currentPrice,
                    details: widget.product.description,
                    image: widget.product.photos[0],
                  );

                  if (cartItems.contains(product)) {
                    return;
                  }

                  setState(() {
                    cartItems.add(product);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        'Product Added Succefully',
                        style: textfont(18, FontWeight.bold, Colors.white),
                      )));
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
