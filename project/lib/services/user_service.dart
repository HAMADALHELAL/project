import 'package:dio/dio.dart';
import 'package:project/models/Token.dart';
import 'package:project/models/usermodel.dart';
import 'package:project/services/client.dart';

class UserService {
  Future<String> signup({required User user}) async {
    try {
      final Response response =
          await ApiClient.post("/signup", data: user.toJson());
      print("Signup Response: ${response.data}");

      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token.toString();
    } catch (e) {
      print("Signup Error: $e");
      throw e.toString();
    }
  }

  Future signin({required User user}) async {
    try {
      final Response response =
          await ApiClient.post("/signin", data: user.toJson());
      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token;
    } catch (e) {
      throw e.toString();
    }
  }
}
