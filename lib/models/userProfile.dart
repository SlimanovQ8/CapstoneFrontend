import 'package:json_annotation/json_annotation.dart';
part 'userProfile.g.dart';
@JsonSerializable()

class UserProfile {
  int? id;
  String? location;
  String? phone;
  int? numOfDonation;
  int? points;
  int? user ;

  UserProfile({
    this.id,
    this.location,
    this.phone,
    this.numOfDonation,
    this.points,
    this.user,
  });


  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}