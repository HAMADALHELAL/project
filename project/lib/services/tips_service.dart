import 'package:dio/dio.dart';
import 'package:project/models/tips.dart';
import 'package:project/services/client.dart';

class TipsServices {
  Future<List<TipsData>> getTips() async {
    try {
      final responseValue = await ApiClient.get("/tips");
      if (responseValue.statusCode == 200) {
        final List<TipsData> listOfTips = List.from(responseValue.data)
            .map((e) => TipsData.fromJson(e))
            .toList();

        return listOfTips;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }

  postTips(String title) async {
    try {
      final Response response = await ApiClient.post(
        "/tips",
        data: {
          "text": title,
        },
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  deleteTip(int? id) async {
    try {
      final Response response = await ApiClient.delete(
        "/tips/$id",
      );
      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
