import 'package:flutter/material.dart';
import 'package:hngx_timbu_shop/services.dart/authservices.dart';
import '../model.dart/errortext.dart';
import '../model.dart/productmodel.dart';
import '../utils/imagepage.dart';
import '../utils/productcard.dart';

// displays the Product being passed
// displays all photos of a product, it's name, availability,
// description and price.
class PageDetails extends StatefulWidget {
  const PageDetails({super.key, required this.product});
  final Product product;

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  static const authservice = AuthService();
  List sizes = ['32', '35', '38', '40', '42', '45'];
  List<Color> color = [
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.red
  ];
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.grey,
              foregroundColor: Colors.grey,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Photo(photos: widget.product.photos),
              ),
            ),
            SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                      ),
                      height: MediaQuery.of(context).size.height * 0.5,
                      padding: const EdgeInsets.all(20.0),
                      width: double.infinity,
                      //color: Colors.grey.shade500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'category name',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.product.name,
                            style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            widget.product.currentPrice,
                            style: const TextStyle(
                              fontSize: 27.0,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          const Row(
                            children: [
                              Text('100 sold'),
                              Icon(
                                Icons.star_border_outlined,
                                size: 15,
                              ),
                              Text('4.5 (32 reviews)'),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          const Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          Text(
                            widget.product.description,
                            style: const TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'Size',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sizes.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 25,
                                      width: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Text(sizes[index]),
                                    ),
                                  );
                                }),
                          ),
                          const Text(
                            'Colors',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: color.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: color[index],
                                        shape: BoxShape.rectangle,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          const Text(
                            'Quatity',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 150,
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade100),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.minimize_outlined),
                                    ),
                                    const Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0XFFf5f4ee),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'More from Ego',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0XFFf5f4ee),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: FutureBuilder(
                                future: authservice.fetchProducts(),
                                builder: (context, snapshot) {
                                  return switch (snapshot.connectionState) {
                                    ConnectionState.waiting => const Center(
                                        child: CircularProgressIndicator
                                            .adaptive()),
                                    ConnectionState.done
                                        when snapshot.hasError =>
                                      Expanded(
                                        child: Center(
                                            child: ErrorText(
                                                error: snapshot.error!)),
                                      ),
                                    ConnectionState.done
                                        when snapshot.hasData =>
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
                                              final product =
                                                  snapshot.data![index];
                                              return Stack(
                                                children: [
                                                  ProductCard(product: product),
                                                  Positioned(
                                                      top:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.02,
                                                      right: 20,
                                                      child: Container(
                                                          width: 35,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              color: Colors.grey
                                                                  .shade100,
                                                              shape: BoxShape
                                                                  .circle),
                                                          child: Center(
                                                            child: TextButton(
                                                                onPressed:
                                                                    () {},
                                                                child: const Icon(
                                                                    Icons
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
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const Column(
                                children: [
                                  Text('Total price'),
                                  Text('37,000:00'),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                    color: Color(0XFFf5f4ee),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
