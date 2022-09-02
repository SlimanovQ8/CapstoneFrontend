import 'package:json_annotation/json_annotation.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/models/charity.dart';
part 'item.g.dart';
@JsonSerializable()

class Item {
  int? id;
  String? name;
  String? description;
  String? image;
  String? condition;
  bool? isReserved;
  Charity? charity_name;
  Category? category_name;

  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.condition,
    this.isReserved,
    this.charity_name,
    this.category_name,
  });


  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}