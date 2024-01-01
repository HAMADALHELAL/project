import 'package:project/models/exercises_model.dart';
import 'package:project/services/client.dart';

class ExcersizeServices {
  Future<List<ExerciseData>> getExcersizes() async {
    try {
      final responseValue = await ApiClient.get("/exercises");
      if (responseValue.statusCode == 200) {
        final List<ExerciseData> listOfExercises = List.from(responseValue.data)
            .map((e) => ExerciseData.fromJson(e))
            .toList();

        return listOfExercises;
      }
    } catch (e) {
      throw e.toString();
    }
    return [];
  }
}
