import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/main.dart';
import 'package:hngx_timbu_shop/model.dart/cartmodel.dart';
import 'package:hngx_timbu_shop/utils/button.dart';
import 'package:hngx_timbu_shop/utils/textfont.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  double totall() {
    double total = 0;
    for (Additems product in cartItems) {
      // ignore: collection_methods_unrelated_type
      total += product.quality;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // const Column(
              //   children: [
              //     Text('Total price'),
              //     Text('#185,000.00'),
              //   ],
              // ),
              // ignore: prefer_const_constructors
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Total price',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    '8888',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              Button(
                width: 100,
                height: 50,
                text: 'Checkout',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: SafeArea(
            child: cartItems.isEmpty
                ? const Center(
                    child: Text('No cart items'),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cart = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 100,
                                      child: Image.network(cart.image)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(cart.name),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                cartItems
                                                    .remove(cartItems[index]);
                                              });
                                            },
                                            icon: const Icon(Icons.close)),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        color: Colors.red,
                                      ),
                                      Text(
                                        'Black',
                                        style: textfont(18, FontWeight.normal,
                                            Colors.grey.shade500),
                                      ),
                                      const Text('|'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('Sized 23'),
                                      // const SizedBox(
                                      //   height: 40,
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        //color: Colors.grey,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  if (cartItems[index]
                                                          .quality ==
                                                      0)
                                                    // ignore: curly_braces_in_flow_control_structures
                                                    return;
                                                  setState(() {
                                                    cartItems[index].quality -=
                                                        1;
                                                  });
                                                },
                                                icon: const Icon(
                                                  Icons.minimize_outlined,
                                                  size: 30,
                                                )),
                                            Text(
                                              cartItems[index]
                                                  .quality
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    cartItems[index].quality +=
                                                        1;
                                                  });
                                                },
                                                icon: const Icon(Icons.add)),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        cart.price,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
      ),
    );
  }
}
