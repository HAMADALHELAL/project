import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/screens/profile.dart';
import 'package:project/screens/signin.dart';
import 'package:project/screens/signup.dart';

void main() {
  runApp(MyApp());
}

final _router = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: 'signup',
    builder: (context, state) => SignUp(),
  ),
  GoRoute(
    path: "/signin",
    name: 'signin',
    builder: (context, state) => SignIn(),
  ),
  GoRoute(
    path: "/userprofile",
    name: 'userprofile',
    builder: (context, state) => UserProfile(),
  ),
]);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
