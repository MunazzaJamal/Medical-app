import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'My Profile',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Hi userabc\nWelcome to Quick Medical store',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              customTile('Edit Profile', Icons.notes, Icons.arrow_forward_ios),
              const Divider(color: Colors.grey),
              customTile('My Orders', Icons.sticky_note_2_outlined,
                  Icons.arrow_forward_ios),
              const Divider(color: Colors.grey),
              customTile('Billing', Icons.watch_later_outlined,
                  Icons.arrow_forward_ios),
              const Divider(color: Colors.grey),
              customTile(
                  'FAQ', Icons.question_mark_rounded, Icons.arrow_forward_ios),
              const Divider(color: Colors.grey),
            ])));
  }

  Widget customTile(txt, leadIcon, trailIcon) {
    return ListTile(
      leading: Icon(leadIcon, color: Colors.black),
      title: Text(txt),
      trailing: IconButton(
        icon: Icon(trailIcon, color: Colors.black, size: 15),
        onPressed: () {
          // Handle your button press logic here
        },
      ),
    );
  }
}
