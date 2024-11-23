import 'package:flutter/material.dart';
import 'dart:async';
import 'package:med_app/splash_2.dart';

class SplashScreen_1 extends StatefulWidget {
  const SplashScreen_1({super.key});

  @override
  _SplashScreen_1State createState() => _SplashScreen_1State();
}

class _SplashScreen_1State extends State<SplashScreen_1> {
  @override
  void initState() {
    super.initState();
    // Delay of 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SplashScreen_2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(65, 87, 255, 1),
      body: Center(
        child: logo(),
      ),
    );
  }
}

Widget logo({Color clr = Colors.white}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 0,
            blurRadius: 7,
            offset: const Offset(0, 5), // Position of the shadow
          ),
        ]),
        child: const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add_outlined,
            size: 100.0,
            color: Colors.blue,
          ),
        ),
      ),

      const SizedBox(height: 20),
      // Text below the logo
      Text(
        'Quick Medical',
        style: TextStyle(
          fontSize: 28,
          color: clr,
        ),
      )
    ],
  );
}
