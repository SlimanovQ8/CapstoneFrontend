import 'package:json_annotation/json_annotation.dart';
part 'charity.g.dart';
@JsonSerializable()

class Charity {
  int? id;
  String? name;
  String? description;
  String? image;
  double? rating;
  String? phone;
  String? location;
  int? charity;

  Charity({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rating,
    this.phone,
    this.location,
    this.charity
  });


  factory Charity.fromJson(Map<String, dynamic> json) => _$CharityFromJson(json);
  Map<String, dynamic> toJson() => _$CharityToJson(this);
}