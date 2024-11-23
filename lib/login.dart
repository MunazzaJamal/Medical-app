import 'package:flutter/material.dart';
import 'package:med_app/home.dart';
import 'package:med_app/splash_1.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController numController = TextEditingController();

  void login() {
    print(numController.text);
    if (numController.text == '123') {
      print('Login Successful');
      numController.clear();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Wrong Mobile Number.'),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog and allow user to try again
                  Navigator.of(context).pop();
                },
                child: const Text('Try Again'),
              ),
            ],
          );
        },
      );
      print('Login Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(clr: Colors.black),
            const SizedBox(height: 100),
            const Text(
              'Please Enter your mobile number\n to Login/Sign Up',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 44,
              child: TextField(
                controller: numController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
              ),
            ),
            const SizedBox(height: 20), // Add spacing before the button
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, fixedSize: const Size(320, 44)),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
