import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()

class User {
  int? id;
  String? first_name;
  String? email;
  String? username;
  String? password;
  bool? isCharity;
  String? location;
  String? description;
  String? charityname;
  String? phone;
  double? rating;
  int? userID ;

  User({
    this.id,
    this.userID,
    this.first_name,
    this.email,
    this.username,
    this.password,
    this.description,
    this.charityname,
    this.isCharity,
    this.phone,
    this.location,
    this.rating,
  });


  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}