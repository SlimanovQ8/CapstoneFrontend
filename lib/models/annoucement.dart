import 'package:json_annotation/json_annotation.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/models/charity.dart';
import 'package:tbr3at/models/user.dart';
part 'annoucement.g.dart';
@JsonSerializable()

class Annoucement {
  int? id;
  String? name;
  String? description;
  String? image;
  String? priority;
  int? quantity;
  int? remaining;
  String? duration;
  String? condition;
  User? charity_name;
  Category? category_name;

  Annoucement({
    this.id,
    this.name,
    this.description,
    this.image,
    this.priority,
    this.quantity,
    this.duration,
    this.remaining,
    this.condition,
    this.charity_name,
    this.category_name,
  });


  factory Annoucement.fromJson(Map<String, dynamic> json) => _$AnnoucementFromJson(json);
  Map<String, dynamic> toJson() => _$AnnoucementToJson(this);
}