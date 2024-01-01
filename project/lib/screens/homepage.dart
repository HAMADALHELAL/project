import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/models/usermodel.dart';
import 'package:project/widgets/home_card.dart';

class HomePage extends StatelessWidget {
  final User user;
  HomePage({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("HomePage")),
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
          HomeCard(title: 'Exercises', icon: Icons.spa, color: Colors.green),
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
