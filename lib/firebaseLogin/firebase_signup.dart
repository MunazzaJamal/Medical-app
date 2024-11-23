import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:med_app/firebaseLogin/firebase_login.dart';
import 'package:med_app/splash_1.dart';

class FirebaseSignup extends StatefulWidget {
  const FirebaseSignup({super.key});

  @override
  State<FirebaseSignup> createState() => _FirebaseSignupState();
}

class _FirebaseSignupState extends State<FirebaseSignup> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  registeruser() async {
    try {} on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(clr: Colors.black),
            const SizedBox(height: 100),
            Container(
              width: 500,
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between TextFields
                  TextField(
                    controller: passwordController,
                    obscureText: true, // To hide password text
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 20), // Add spacing before the button
                  ElevatedButton(
                    onPressed: () async {
                      await registeruser();
                    }, // Call the login function
                    child: Text('Register'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FirebaseLogin()));
                    }, // Call the login function
                    child: Text('Already have an account? Login'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
