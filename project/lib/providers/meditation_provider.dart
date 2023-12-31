import 'package:flutter/material.dart';
import 'package:project/models/meditation.dart';
import 'package:project/services/meditation.dart';

class MeditationProvider extends ChangeNotifier {
  List<MeditationData> meditationList = [];

  final MeditationService _meditationService = MeditationService();

  Future<List<MeditationData>> getMedit() async {
    try {
      meditationList = await _meditationService.getMeditation();
      notifyListeners();
      return meditationList;
    } catch (e) {
      throw e.toString();
    }
  }
}
