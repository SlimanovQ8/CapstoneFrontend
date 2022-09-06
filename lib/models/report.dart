import 'package:json_annotation/json_annotation.dart';
import 'package:tbr3at/models/category.dart';
import 'package:tbr3at/models/charity.dart';
import 'package:tbr3at/models/user.dart';

import 'item.dart';
part 'report.g.dart';
@JsonSerializable()

class Report {
  int? id;
  String? name;
  String? description;
  User? created_by;
  User? to;
  Item? item;

  Report({
    this.id,
    this.name,
    this.description,
    this.created_by,
    this.to,
    this.item,
  });


  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}