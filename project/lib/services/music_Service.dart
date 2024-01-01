import 'package:project/models/music_model.dart';
import 'package:project/services/client.dart';

class MusicServices {
  Future<List<MusicData>> getMusic() async {
    try {
      final responseValue = await ApiClient.get("/music");
      if (responseValue.statusCode == 200) {
        final List<MusicData> listOfMusic = List.from(responseValue.data)
            .map((e) => MusicData.fromJson(e))
            .toList();

        return listOfMusic;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
