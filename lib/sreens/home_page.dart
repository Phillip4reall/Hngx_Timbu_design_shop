import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/services.dart/authservices.dart';
import 'package:hngx_timbu_shop/utils/category.dart';
import 'package:hngx_timbu_shop/utils/productcard.dart';
import 'package:hngx_timbu_shop/utils/textfont.dart';
import '../model.dart/errortext.dart';
import '../utils/cardproduct.dart';
import '../utils/indicator.dart';
import 'productdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pagecontroller = PageController();
  static const authservice = AuthService();
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 15),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AG-Ezenard',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.brown,
                      radius: 20,
                      child: Text(
                        'AD',
                        style: textfont(25, FontWeight.bold, Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Good afternoon',
                              style: textfont(
                                  18, FontWeight.normal, Colors.black12),
                            ),
                            const Icon(
                              Icons.waving_hand_sharp,
                              size: 15,
                              color: Colors.brown,
                            )
                          ],
                        ),
                        Text(
                          'Ada Dennis',
                          style: textfont(20, FontWeight.bold, Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: FutureBuilder(
                      future: authservice.fetchProducts(),
                      builder: (context, snapshot) {
                        return
                            //switch (snapshot.connectionState) {
                            //  ConnectionState.waiting => const Center(
                            //     child: CircularProgressIndicator.adaptive()),
                            //  ConnectionState.done when snapshot.hasError =>
                            //   Expanded(
                            //    child: Center(
                            //       child: ErrorText(error: snapshot.error!)),
                            // ),
                            // ConnectionState.done when snapshot.hasData =>
                            //: snapshot.data),
                            Stack(
                          alignment: Alignment.center,
                          children: [
                            Expanded(
                              child: PageView.builder(
                                controller: pagecontroller,
                                itemCount: snapshot.data!.length,
                                onPageChanged: (index) =>
                                    setState(() => _currentIndex = index),
                                itemBuilder: (_, index) {
                                  final product = snapshot.data![index];
                                  return Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Cardproduct(
                                      product: product,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              //top: 1,
                              bottom: 20.0,
                              child: Row(
                                children: [
                                  for (var i = 0; i < 4; i++) ...[
                                    Indicator(isCurrent: _currentIndex == i),
                                    const SizedBox(width: 4.0),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        );
                        // _ => const SizedBox(),
                        //};
                        // _ => const SizedBox(),
                        // Pageviews(product: );
                      }),
                ),
                // PageView.builder(
                //   controller: pagecontroller,
                //   scrollDirection: Axis.horizontal,
                //   itemCount: 5,
                //   itemBuilder: (context, index) {
                //     return const Cardproduct();
                //   },
                // ),
                //const Cardproduct()),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Category(text: 'Watch', icon: Icons.watch_outlined),
                    Category(text: 'Tv', icon: Icons.tv_off_outlined),
                    Category(text: 'Phone', icon: Icons.phone_android_outlined),
                    Category(text: 'Blender', icon: Icons.blender_outlined),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Category(
                        text: 'Laptop', icon: Icons.laptop_chromebook_outlined),
                    Category(text: 'Cliper', icon: Icons.class_outlined),
                    Category(text: 'Glove', icon: Icons.golf_course_outlined),
                    Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            shape: BoxShape.circle),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style:
                                  textfont(15, FontWeight.bold, Colors.black),
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Our Special Offers',
                  style: textfont(20, FontWeight.bold, Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  child: FutureBuilder(
                      future: authservice.fetchProducts(),
                      builder: (context, snapshot) {
                        return switch (snapshot.connectionState) {
                          ConnectionState.waiting => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          ConnectionState.done when snapshot.hasError =>
                            Expanded(
                              child: Center(
                                  child: ErrorText(error: snapshot.error!)),
                            ),
                          ConnectionState.done when snapshot.hasData =>
                            Expanded(
                              child: GridView.builder(
                                  shrinkWrap: false,
                                  itemCount: 4,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.65,
                                          mainAxisSpacing: 28.0,
                                          crossAxisSpacing: 20.0,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    final product = snapshot.data![index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PageDetails(
                                                        product: product)));
                                      },
                                      child: Stack(
                                        children: [
                                          ProductCard(product: product),
                                          Positioned(
                                              top: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.02,
                                              right: 20,
                                              child: Container(
                                                  width: 35,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade100,
                                                      shape: BoxShape.circle),
                                                  child: Center(
                                                    child: TextButton(
                                                        onPressed: () {},
                                                        child: const Icon(Icons
                                                            .favorite_border_outlined)),
                                                  )))
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          _ => const SizedBox(),
                        };
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Features Products',
                  style: textfont(20, FontWeight.bold, Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 500,
                  child: FutureBuilder(
                      future: authservice.fetchProducts(),
                      builder: (context, snapshot) {
                        return switch (snapshot.connectionState) {
                          ConnectionState.waiting => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          ConnectionState.done when snapshot.hasError =>
                            Expanded(
                              child: Center(
                                  child: ErrorText(error: snapshot.error!)),
                            ),
                          ConnectionState.done when snapshot.hasData =>
                            Expanded(
                              child: GridView.builder(
                                  itemCount: 4,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 0.65,
                                          mainAxisSpacing: 28.0,
                                          crossAxisSpacing: 20.0,
                                          crossAxisCount: 2),
                                  itemBuilder: (context, index) {
                                    final product = snapshot.data![index];
                                    return Stack(
                                      children: [
                                        ProductCard(product: product),
                                        Positioned(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                            right: 20,
                                            child: Container(
                                                width: 35,
                                                height: 35,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade100,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: TextButton(
                                                      onPressed: () {},
                                                      child: const Icon(Icons
                                                          .favorite_border_outlined)),
                                                )))
                                      ],
                                    );
                                  }),
                            ),
                          _ => const SizedBox(),
                        };
                      }),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
