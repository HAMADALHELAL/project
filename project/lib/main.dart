import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/models/usermodel.dart';
import 'package:project/providers/exercises_provider.dart';
import 'package:project/providers/meditation_provider.dart';
import 'package:project/providers/music_provider.dart';
import 'package:project/providers/tips_provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/screens/addtip.dart';
import 'package:project/screens/excercises.dart';
import 'package:project/screens/homepage.dart';
import 'package:project/screens/meditation.dart';
import 'package:project/screens/musicpage.dart';
import 'package:project/screens/profile.dart';
import 'package:project/screens/signin.dart';
import 'package:project/screens/signup.dart';
import 'package:project/screens/tips.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MeditationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ExercisesProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TipsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MusicProvider(),
    ),
  ], child: MyApp()));
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
    builder: (context, state) => UserProfile(
      user: state.extra as User,
    ),
  ),
  GoRoute(
    path: "/homepage",
    name: 'homepage',
    builder: (context, state) => HomePage(
      user: state.extra as User,
    ),
  ),
  GoRoute(
    path: "/meditation",
    name: 'meditation',
    builder: (context, state) => MeditationPage(),
  ),
  GoRoute(
    path: "/excercises",
    name: 'excercises',
    builder: (context, state) => ExercisesPage(),
  ),
  GoRoute(
    path: "/tips",
    name: 'tips',
    builder: (context, state) => TipsPage(),
  ),
  GoRoute(
    path: "/music",
    name: 'music',
    builder: (context, state) => MusicPage(),
  ),
  GoRoute(
    path: "/addtip",
    name: 'addtip',
    builder: (context, state) => AddTip(),
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
