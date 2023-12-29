// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String? username;
  String? image;
  int? exp;
  int? finishedExercises;
  int? iat;
  String? password;
  User({
    this.id,
    this.username,
    this.image,
    this.exp,
    this.finishedExercises,
    this.iat,
    this.password,
  });

  User copyWith({
    int? id,
    String? username,
    String? image,
    int? exp,
    int? finishedExercises,
    int? iat,
    String? password,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      image: image ?? this.image,
      exp: exp ?? this.exp,
      finishedExercises: finishedExercises ?? this.finishedExercises,
      iat: iat ?? this.iat,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'image': image,
      'exp': exp,
      'finishedExercises': finishedExercises,
      'iat': iat,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] != null ? map['username'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      exp: map['exp'] != null ? map['exp'] as int : null,
      finishedExercises: map['finishedExercises'] != null
          ? map['finishedExercises'] as int
          : null,
      iat: map['iat'] != null ? map['iat'] as int : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, image: $image, exp: $exp, finishedExercises: $finishedExercises, iat: $iat, password: $password)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.image == image &&
        other.exp == exp &&
        other.finishedExercises == finishedExercises &&
        other.iat == iat &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        image.hashCode ^
        exp.hashCode ^
        finishedExercises.hashCode ^
        iat.hashCode ^
        password.hashCode;
  }
}
