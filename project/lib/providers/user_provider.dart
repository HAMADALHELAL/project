import 'package:flutter/material.dart';
import 'package:project/models/usermodel.dart';
import 'package:project/services/user_service.dart';

class UserProvider extends ChangeNotifier {
  final userService = UserService();
  String token = "";

  Future<String> signup({required User user}) async {
    token = await userService.signup(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }
}
