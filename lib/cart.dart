// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:med_app/func.dart';
import 'package:med_app/home.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});
  // int items = cartProducts.length;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Your Cart'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen())); // Navigate back to the previous screen
              },
            )),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${cartProducts.length} items in your cart',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // Removes padding

                                backgroundColor:
                                    Colors.transparent, // Ensures no background
                              ),
                              child: const Row(children: [
                                Icon(Icons.add, color: Colors.blue, size: 15),
                                Text(
                                  "Add more",
                                  style: TextStyle(
                                    color: Colors.blue, // Customize text color
                                    fontSize: 16, // Customize font size
                                  ),
                                ),
                              ]),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        return customProd(
                            '${cartProducts[index]['title']}',
                            '${cartProducts[index]['subtitle']}',
                            'Rs. ${cartProducts[index]['price']}',
                            '${cartProducts[index]['image']}',
                            index);
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Payment Summary',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Order Total',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(9, 15, 71, 0.45))),
                        Text('${orderTotal()}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Items Discount',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(9, 15, 71, 0.45))),
                        Text('Rs. -${discount()}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Coupon Discount',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(9, 15, 71, 0.45))),
                        Text('Rs. 0}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(9, 15, 71, 0.45))),
                        Text('FREE',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total',
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        Text('Rs. ${grandTotal()}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            if (cartProducts.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Cart is empty'),
                                    content:
                                        const Text('Please select products.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          cartProducts.clear();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen()));
                                        },
                                        child: const Text('Okay'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Order Placed'),
                                    content: const Text(
                                        'The order will be deliver in 4-5 working days.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          cartProducts.clear();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreen()));
                                        },
                                        child: const Text('Thank you'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(330, 45),
                              backgroundColor:
                                  const Color.fromRGBO(65, 87, 255, 1)),
                          child: const Text('Place Order',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                    )
                  ])),
        ));
  }

  Widget customProd(String prodName, String prodDesc, String prodPrice,
      String prodImg, index) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 70.0,
            height: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              image: DecorationImage(
                image: AssetImage(prodImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prodName,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  prodDesc,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  prodPrice,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: const Icon(Icons.cancel_outlined,
                      color: Colors.grey, size: 24),
                  onPressed: () {
                    // cartProducts.removeAt(index);
                    removeFromCart(cartProducts[index]);
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(height: 15),
              customCount(index)
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget customCount(index) {
    return Container(
      height: 32,
      // width: 85,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 244, 255, 1),
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              decrementQuantity(index);
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(223, 227, 255, 1),
                shape: const CircleBorder()),
            child: const Icon(
              Icons.remove,
              color: Color.fromRGBO(65, 87, 255, 1),
              size: 15,
            ),
          ),
          Text(
            '${cartProducts[index]['quantity']}',
            style: TextStyle(fontSize: 16),
          ),
          ElevatedButton(
            onPressed: () {
              incrementQuantity(index);
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(160, 171, 255, 1),
              shape: const CircleBorder(),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  double discount() {
    double discountedPrice = 0.0;
    for (var product in cartProducts) {
      var price = orderTotal();

      if (price > 1000) {
        discountedPrice = price * 0.2;
      } else if (price > 500) {
        discountedPrice = price * 0.1;
      } else
        discountedPrice = 0;
    }
    return discountedPrice;
  }

  double grandTotal() {
    double total = 0.0;
    for (var product in cartProducts) {
      total = orderTotal() - discount();
    }
    return total;
  }

  void incrementQuantity(int index) {
    setState(() {
      cartProducts[index]['quantity']++;
    });
  }

  // Function to decrement quantity
  void decrementQuantity(int index) {
    setState(() {
      if (cartProducts[index]['quantity'] > 1) {
        cartProducts[index]['quantity']--;
      }
    });
  }

  // Function to calculate the total price
  double orderTotal() {
    double total = 0.0;
    for (var product in cartProducts) {
      total += product['price'] * product['quantity'];
    }
    return total;
  }

  void removeFromCart(Map<String, dynamic> product) {
    for (var cartProduct in cartProducts) {
      if (cartProduct['title'] == product['title']) {
        if (cartProduct['quantity'] > 1) {
          cartProduct['quantity']--;
        } else {
          cartProducts.remove(cartProduct);
        }
        break;
      }
    }
  }
}
