/*import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<UserProvider>().readFromStorage(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("token : ${context.read<UserProvider>().token}");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else {
            final String? token = snapshot.data;

            if (token != null && token.isNotEmpty) {
              WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
                GoRouter.of(context).go("/userprofile");
              });
            } else {
              WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
                GoRouter.of(context).go("/signup");
              });
            }
            return SizedBox();
          }
        },
      ),
    );
  }
}*/
