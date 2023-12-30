import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String name;
  // Add more properties as needed

  // Constructor to receive user data
  UserProfile({
    required this.name,
    // Add more parameters as needed
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("gg"),
              ),
              SizedBox(height: 20),
              Text(
                'Name: $name',
                style: TextStyle(fontSize: 18),
              ),
              // Add more user information widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
