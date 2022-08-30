import 'package:json_annotation/json_annotation.dart';
part 'annoucement.g.dart';
@JsonSerializable()

class Annoucement {
  int? id;
  String? name;
  String? description;
  String? image;
  String? priority;
  int? quantity;
  String? duration;
  String? condition;
  int? charity_name;
  int? category_name;

  Annoucement({
    this.id,
    this.name,
    this.description,
    this.image,
    this.priority,
    this.quantity,
    this.duration,
    this.condition,
    this.charity_name,
    this.category_name,
  });


  factory Annoucement.fromJson(Map<String, dynamic> json) => _$AnnoucementFromJson(json);
  Map<String, dynamic> toJson() => _$AnnoucementToJson(this);
}