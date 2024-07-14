import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/model.dart/productmodel.dart';
import 'package:hngx_timbu_shop/utils/cardproduct.dart';

import 'indicator.dart';

// displays all photos belonging to a product in a carousel manner,
// using the swipe gesture
// ignore: must_be_immutable
class Pageviews extends StatefulWidget {
  Pageviews({super.key, required this.product});
  //final List<String> photos;
  List<Product> product;

  @override
  State<Pageviews> createState() => _PageviewsState();
}

class _PageviewsState extends State<Pageviews> {
  final _controller = PageController();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.product.length,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          itemBuilder: (_, index) {
            final product = widget.product[index];
            return Cardproduct(
              product: product,
            );
          },
        ),
        Positioned(
          bottom: 10.0,
          child: Row(
            children: [
              for (var i = 0; i < widget.product.length; i++) ...[
                Indicator(isCurrent: _currentIndex == i),
                const SizedBox(width: 4.0),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
