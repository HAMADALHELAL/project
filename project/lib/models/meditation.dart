// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MeditationModel {
  List<MeditationData>? meditationData;

  MeditationModel({this.meditationData});

  MeditationModel.fromJson(Map<String, dynamic> json) {
    if (json['MeditationData'] != null) {
      meditationData = <MeditationData>[];
      json['MeditationData'].forEach((v) {
        meditationData!.add(new MeditationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meditationData != null) {
      data['MeditationData'] =
          this.meditationData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeditationData {
  int? id;
  String? title;
  String? file;

  MeditationData({this.id, this.title, this.file});

  MeditationData.fromJson(Map<String, dynamic> json) {
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

class Meditation {
  int? id;
  String? title;
  String? file;
  Meditation({
    this.id,
    this.title,
    this.file,
  });

  Meditation copyWith({
    int? id,
    String? title,
    String? file,
  }) {
    return Meditation(
      id: id ?? this.id,
      title: title ?? this.title,
      file: file ?? this.file,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'file': file,
    };
  }

  factory Meditation.fromMap(Map<String, dynamic> map) {
    return Meditation(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      file: map['file'] != null ? map['file'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meditation.fromJson(String source) =>
      Meditation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Meditation(id: $id, title: $title, file: $file)';

  @override
  bool operator ==(covariant Meditation other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.file == file;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ file.hashCode;
}
