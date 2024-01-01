class MusicModel {
  List<MusicData>? musicData;

  MusicModel({this.musicData});

  MusicModel.fromJson(Map<String, dynamic> json) {
    if (json['musicData'] != null) {
      musicData = <MusicData>[];
      json['musicData'].forEach((v) {
        musicData!.add(new MusicData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.musicData != null) {
      data['musicData'] = this.musicData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MusicData {
  int? id;
  String? title;
  String? file;

  MusicData({this.id, this.title, this.file});

  MusicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['file'] = this.file;
    return data;
  }
}
