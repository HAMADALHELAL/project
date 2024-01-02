// tips_provider.dart

import 'package:flutter/material.dart';
import 'package:project/models/tips.dart';
import 'package:project/services/tips_service.dart';

class TipsProvider extends ChangeNotifier {
  List<TipsData> tipsList = [];

  final TipsServices _tipsServices = TipsServices();

  Future<List<TipsData>> getTips() async {
    try {
      tipsList = await _tipsServices.getTips();
      notifyListeners();
      return tipsList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> createNewTips(String title) async {
    try {
      await _tipsServices.postTips(title);
      await getTips();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteTip(int? id) async {
    try {
      await _tipsServices.deleteTip(id);
      tipsList.removeWhere((tip) => tip.id == id);
      notifyListeners();
    } catch (e) {
      throw e.toString();
    }
  }

  // ... (other methods and properties remain unchanged)

  void reverseTipsList() {
    tipsList = tipsList.reversed.toList();
    notifyListeners();
  }
}
