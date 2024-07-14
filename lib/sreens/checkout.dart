import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/main.dart';
import 'package:hngx_timbu_shop/sreens/success.dart';

import '../utils/button.dart';
import '../utils/customfield.dart';
import '../utils/textfont.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
                Button(
                  width: 100,
                  height: 50,
                  text: 'Cancel',
                  onTap: () {},
                ),
                Button(
                  width: 100,
                  height: 50,
                  text: 'Checkout',
                  onTap: () {
                    showModalBottomSheet(
                        constraints:
                            const BoxConstraints(maxHeight: double.infinity),
                        isScrollControlled: false,

                        // barrierColor: Colors.transparent,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Select a payment option',
                                      style: textfont(
                                          20, FontWeight.bold, Colors.black),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.close))
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Image.asset(
                                  fit: BoxFit.fill,
                                  'image/atm.PNG',
                                  width: MediaQuery.of(context).size.width,
                                  height: 30,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Add a new card',
                                      style: textfont(15, FontWeight.normal,
                                          Colors.lightBlue),
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text('Full name'),
                                const Customfield(text: 'Enter your full name'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Email address'),
                                const Customfield(
                                    text: 'Enter your email address'),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Phone number'),
                                const Customfield(
                                    text: 'Enter your phone number'),
                                const SizedBox(
                                  height: 25,
                                ),
                                Button(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Success()));
                                    },
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    text: 'Proceed to payment')
                              ],
                            ),
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Checkout'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Order list'),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Edit',
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            height: 100,
                                            child: Image.network(
                                                cartItems[index].image)),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 170,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(cartItems[index].name),
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
                                              style: textfont(
                                                  18,
                                                  FontWeight.normal,
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
                                            const Text(
                                              'Quantity',
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Container(
                                              height: 25,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade300,
                                                  shape: BoxShape.rectangle),
                                              //color: Colors.grey,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${cartItems[index].quality}',
                                                    style: const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              cartItems[index].price,
                                              style: const TextStyle(
                                                  fontSize: 15,
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
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Personal information',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Edit',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey.shade200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Ada Dennis'),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      '090000000',
                                      style: TextStyle(),
                                    ))
                              ]),
                          const Text('Ad@gmail.com'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Delivery option',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Edit',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.grey.shade200,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Pick up point'),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'ikeja, Lagos',
                                  style: TextStyle(),
                                ))
                          ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Price summary',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.grey.shade200,
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total price'),
                              Text('#  185,000'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Delivery fee'),
                              Text('#  185,000'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Discount'),
                              Text('# 00.0'),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total '),
                              Text('#   185,000'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
