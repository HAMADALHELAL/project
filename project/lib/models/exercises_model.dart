class ExerciseModel {
  List<ExerciseData>? exerciseData;

  ExerciseModel({this.exerciseData});

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    if (json['ExerciseData'] != null) {
      exerciseData = <ExerciseData>[];
      json['ExerciseData'].forEach((v) {
        exerciseData!.add(new ExerciseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exerciseData != null) {
      data['ExerciseData'] = this.exerciseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExerciseData {
  int? id;
  String? title;
  String? file;
  bool? finished;

  ExerciseData({this.id, this.title, this.file, this.finished});

  ExerciseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file = json['file'];
    finished = json['finished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['file'] = this.file;
    data['finished'] = this.finished;
    return data;
  }
}
