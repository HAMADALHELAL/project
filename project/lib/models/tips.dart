class TipsModel {
  List<TipsData>? tipsList;

  TipsModel({this.tipsList});

  TipsModel.fromJson(Map<String, dynamic> json) {
    if (json['tipsList'] != null) {
      tipsList = <TipsData>[];
      json['tipsList'].forEach((v) {
        tipsList!.add(new TipsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tipsList != null) {
      data['tipsList'] = this.tipsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TipsData {
  int? id;
  String? text;
  String? author;
  List<int>? upvotes;
  List<String>? downvotes;

  TipsData({this.id, this.text, this.author, this.upvotes, this.downvotes});

  TipsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    author = json['author'];
    upvotes = json['upvotes'].cast<int>();
    downvotes = json['downvotes'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['author'] = this.author;
    data['upvotes'] = this.upvotes;
    data['downvotes'] = this.downvotes;
    return data;
  }
}
