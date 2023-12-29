import 'package:dio/dio.dart';
import 'package:project/models/Token.dart';
import 'package:project/models/usermodel.dart';
import 'package:project/services/client.dart';

class UserService {
  Future<String> signup({required User user}) async {
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final Response response =
            await ApiClient.post("/signup", data: user.toJson());

        Token tokenModle = Token.fromJson(response.data);
        return tokenModle.token.toString();
      }
      return "";
    } catch (e) {
      print("GGEZ");
      throw e.toString();
    }
  }
}
