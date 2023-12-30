import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/models/usermodel.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ggez")),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              context.goNamed("userprofile", extra: user);
              // Add the logic to navigate to the profile page or open a drawer, etc.
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2, // You can adjust the number of columns as needed
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        padding: EdgeInsets.all(16),
        children: [
          HomeCard(title: 'Tips', icon: Icons.lightbulb, color: Colors.blue),
          HomeCard(title: 'Yoga Videos', icon: Icons.spa, color: Colors.green),
          HomeCard(
              title: 'Music', icon: Icons.music_note, color: Colors.orange),
          HomeCard(
              title: 'Meditation',
              icon: Icons.self_improvement,
              color: Colors.purple),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  HomeCard({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      child: InkWell(
        onTap: () {
          // Add logic to handle card tap
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
