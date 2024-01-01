import 'package:flutter/material.dart';
import 'package:project/models/music_model.dart';
import 'package:project/services/music_Service.dart';

class MusicProvider extends ChangeNotifier {
  List<MusicData> musicList = [];

  final MusicServices _musicServices = MusicServices();

  Future<List<MusicData>> getMusic() async {
    try {
      musicList = await _musicServices.getMusic();
      notifyListeners();
      return musicList;
    } catch (e) {
      throw e.toString();
    }
  }
}
