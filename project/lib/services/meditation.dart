import 'package:project/models/meditation.dart';
import 'package:project/services/client.dart';

class MeditationService {
  Future<List<MeditationData>> getMeditation() async {
    try {
      final responseValue = await ApiClient.get("/meditation");
      if (responseValue.statusCode == 200) {
        final List<MeditationData> listOfMeditations =
            List.from(responseValue.data)
                .map((e) => MeditationData.fromJson(e))
                .toList();

        return listOfMeditations;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
