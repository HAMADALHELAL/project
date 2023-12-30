import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/models/usermodel.dart';

class UserProfile extends StatelessWidget {
  final User user;

  UserProfile({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('User Profile')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage("gg"),
              ),
              SizedBox(height: 20),
              Text(
                'Name: ${user.username} ',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic for the first button
                  context.goNamed("homepage", extra: user);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Home Page',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  // Add logic for the second button
                  context.goNamed("signup");
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  backgroundColor: Colors.green,
                ),
                child: Text(
                  'logout',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
