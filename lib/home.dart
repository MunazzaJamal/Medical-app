import 'package:flutter/material.dart';
import 'package:med_app/cart.dart';
import 'package:med_app/func.dart';
import 'package:med_app/prodDetails.dart';
import 'package:med_app/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController findController = TextEditingController();
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getCurrentView(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: 'Medical'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }

  Widget getCurrentView() {
    if (currentindex == 0) {
      return gethomeview();
    } else if (currentindex == 1) {
      return Screen('Notification screen');
    } else if (currentindex == 2) {
      return Screen('Medical screen');
    } else if (currentindex == 3) {
      return CartScreen();
    } else if (currentindex == 4)
      return const ProfileScreen();
    else
      return Screen('Default screen');
  }

  Widget gethomeview() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 1, left: 1),
            child: Container(
                width: double.infinity,
                height: 213,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(65, 87, 255, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: const Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32, left: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('profile.jpg'),
                          radius: 24,
                        ),
                        Row(children: [
                          IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.notifications_none_sharp,
                                size: 24,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: null,
                              icon: Icon(Icons.shopping_bag_outlined,
                                  size: 24, color: Colors.white))
                        ])
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 28.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Hi, User',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 28.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Welcome to Quick Medical store',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        )),
                  )
                ])),
          ),
          const SizedBox(height: 10),
          Container(
            width: 400,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(56)),
            child: TextField(
              controller: findController,
              obscureText: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        56), // Match the container's rounded corners
                    borderSide: const BorderSide(
                        color:
                            Colors.transparent), // To remove the border color
                  ),
                  labelText: 'Search Medicine & Healthcare Products',
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18,
                  )),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Categories',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              topcategories(const Color.fromRGBO(255, 149, 152, 1), 'Dental'),
              topcategories(const Color.fromRGBO(25, 229, 165, 1), 'Wellness'),
              topcategories(const Color.fromRGBO(255, 192, 111, 1), 'Homeo'),
              topcategories(const Color.fromRGBO(77, 183, 255, 1), 'EyeCare'),
            ],
          ),
          const SizedBox(height: 10),
          Container(
              width: 400,
              height: 146,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                    image: AssetImage('ad1.png'), fit: BoxFit.cover),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 38.0, top: 12),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Save extra on\n every order',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromRGBO(25, 135, 251, 1)),
                        ),
                        SizedBox(height: 10),
                        Text('Etiam mollis metus\n non faucibus .',
                            style: TextStyle(color: Colors.grey, fontSize: 12))
                      ],
                    )),
              )),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Deals of the day',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  'More',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(0, 106, 255, 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          gridview(medicalProducts),
        ],
      ),
    );
  }
}
