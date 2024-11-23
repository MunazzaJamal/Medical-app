import 'package:flutter/material.dart';
import 'package:med_app/firebaseLogin/firebase_signup.dart';
import 'dart:async';
import 'package:med_app/login.dart';

class SplashScreen_2 extends StatefulWidget {
  const SplashScreen_2({super.key});

  @override
  _SplashScreen_2State createState() => _SplashScreen_2State();
}

class _SplashScreen_2State extends State<SplashScreen_2> {
  @override
  void initState() {
    super.initState();
    // Delay of 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FirebaseSignup()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset('assets/splash_1.png', width: 257, height: 290),

            const SizedBox(height: 20),
            // Text below the logo
            const Text(
              'View and buy\n Medicine Online',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Etiam mollis metus non purus\n faucibus sollicitudin. Pellentesque\n sagittis mi. Integer.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                    onPressed: () {
                      // Action when button is pressed
                      print('TextButton pressed');
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextButton(
                    onPressed: () {
                      print('TextButton pressed');
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
