import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:med_app/cart.dart';
import 'package:med_app/func.dart';
import 'package:med_app/home.dart';

class ProductScreen extends StatefulWidget {
  final dynamic prod;

  const ProductScreen(this.prod, {super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const HomeScreen())); // Navigate back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.notifications_none), // Add an icon on the right (search)
            onPressed: () {
              print("Search icon tapped");
            },
          ),
          IconButton(
            icon: const Icon(Icons
                .shopping_bag_outlined), // Add another icon (notifications)
            onPressed: () {
              print("Notifications icon tapped");
            },
          ),
        ],
      ),
      body: getprod(context),
    );
  }

  Widget getprod(context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${widget.prod['title']}',
              style:
                  const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 5,
          ),
          Text('${widget.prod['subtitle']}',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            // child: Flexible(
            child: Container(
                color: Colors.grey[200],
                height: 200,
                width: 327,
                child: Image.asset('${widget.prod['image']}',
                    fit: BoxFit.contain)),
          ),
          // ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 45,
              width: 120,
              child: TextButton(
                onPressed: () {
                  print("Add to cart button tapped");
                  // cartProducts.add(widget.prod);
                  addToCart(widget.prod);

                  print(cartProducts);

                  setState(() {});
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.add_box_outlined,
                      color: Colors.blue,
                      size: 16,
                    ),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.blue, // Customize text color
                        fontSize: 14, // Customize font size
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Text('Rs ${widget.prod['price']}',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text('${widget.prod['company']}',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey)),
          const Divider(),
          const Text('Package size',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150, //  item width
                crossAxisSpacing: 7.0,
                mainAxisSpacing: 5.0,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    height: 150, // Explicit height
                    color:
                        Colors.grey.shade200, // Add a background to visualize
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.prod['packageSizes'][index]['price']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${widget.prod['packageSizes'][index]['size']}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Text('Product Details',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 6),
          Text('${widget.prod['productDetails']}',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          const Text('Ingredients',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(height: 6),
          Text('${widget.prod['ingredients']}',
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Expiry Date',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Text('${widget.prod['expiryDate']}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Brand Name',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 10,
                width: 10,
              ),
              Text('${widget.prod['brandName']}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                      color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('${widget.prod['rating']}',
                    style: const TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                const SizedBox(width: 8),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 25,
                ),
                const SizedBox(height: 15),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('923 Ratings\nand 257 reviews',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey)),
                  const SizedBox(width: 8),
                  const Spacer(),
                  Container(
                    height: 145, // Set a height
                    width: 1.5, // Divider thickness
                    color: Colors.grey,
                  ),
                  Builder(
                      builder: (context) => ratingBar(context, [
                            {"stars": 5, "percentage": 70, "count": 350},
                            {"stars": 4, "percentage": 20, "count": 100},
                            {"stars": 3, "percentage": 5, "count": 25},
                            {"stars": 2, "percentage": 3, "count": 15},
                            {"stars": 1, "percentage": 2, "count": 10},
                          ])),
                ],
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.prod['reviews'].length,
            itemBuilder: (context, index) {
              return review(widget.prod['reviews'][index]);
            },
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 45),
                    backgroundColor: const Color.fromRGBO(65, 87, 255, 1)),
                child: const Text('Go to Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    ));
  }

  Widget ratingBar(BuildContext context, List<Map<String, dynamic>> ratings) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: ratings.map((rating) {
          double percentage = rating['percentage'];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min, // Prevents flex issues
                  children: [
                    // Stars on the left
                    Row(
                      children: List.generate(
                        rating['stars'],
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    // Percentage Bar in the center
                    Stack(
                      children: [
                        // Background line
                        Container(
                          width: 100, // Fixed width for the bar
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        // Filled line
                        Container(
                          width: percentage, // Adjust width as percentage
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    // Percentage count
                    Text(
                      '${rating['count']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget review(Map<String, dynamic> reviewData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 4.0,
                offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            // Rating Icon
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 30,
            ),
            SizedBox(width: 10),

            // Rating Value
            Text(
              '${widget.prod['rating']}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),

            // Reviewer's Name and Review Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewData['reviewer'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    reviewData['comment'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(Map<String, dynamic> product) {
    bool productExists = false;

    for (var cartProduct in cartProducts) {
      if (cartProduct['title'] == product['title']) {
        cartProduct['quantity']++;
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      cartProducts.add({...product, 'quantity': 1});
    }
  }
}
