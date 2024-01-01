import 'package:flutter/material.dart';
import 'package:project/models/exercises_model.dart';
import 'package:project/services/excesizesService.dart';

class ExercisesProvider extends ChangeNotifier {
  List<ExerciseData> exercisesList = [];

  final ExcersizeServices _excersizeServices = ExcersizeServices();

  Future<List<ExerciseData>> getExercises() async {
    try {
      exercisesList = await _excersizeServices.getExcersizes();
      notifyListeners();
      return exercisesList;
    } catch (e) {
      throw e.toString();
    }
  }
}
