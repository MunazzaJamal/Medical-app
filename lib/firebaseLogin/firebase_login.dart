import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:med_app/home.dart';

//registered email: abc@gmail.com
//password: abc#@!

class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({super.key});

  @override
  State<FirebaseLogin> createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  login() async {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print('Login successful: ${credential.user?.email}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen()), // replace with your screen
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        print('No user found for that email.');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Failed'),
              content: const Text('Wrong User email or password.'),
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
        //  else if (e.code == 'wrong-password') {
        //   print('Wrong password provided for that user.');
        //   showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: const Text('Login Failed'),
        //         content: const Text('Wrong password.'),
        //         actions: [
        //           TextButton(
        //             onPressed: () {
        //               // Close the dialog and allow user to try again
        //               Navigator.of(context).pop();
        //             },
        //             child: const Text('Try Again'),
        //           ),
        //         ],
        //       );
        //     },
        //   );
      } else {
        print('Else condition: ${e.code}');
      }
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
                      await login();
                    }, // Call the login function
                    child: Text('Login'),
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
