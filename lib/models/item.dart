import 'package:json_annotation/json_annotation.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/models/charity.dart';
import 'package:tbr3at/models/user.dart';
part 'item.g.dart';
@JsonSerializable()

class Item {
  int? id;
  String? name;
  String? description;
  String? image;
  String? condition;
  bool? isReserved;
  User? charity_name;
  Category? category_name;
  User? created_by;

  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.condition,
    this.isReserved,
    this.charity_name,
    this.category_name,
    this.created_by,
  });


  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}