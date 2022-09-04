// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      condition: json['condition'] as String?,
      isReserved: json['isReserved'] as bool?,
      charity_name: json['charity_name'] == null
          ? null
          : Charity.fromJson(json['charity_name'] as Map<String, dynamic>),
      category_name: json['category_name'] == null
          ? null
          : Category.fromJson(json['category_name'] as Map<String, dynamic>),
      created_by: json['created_by'] == null
          ? null
          : User.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'condition': instance.condition,
      'isReserved': instance.isReserved,
      'charity_name': instance.charity_name,
      'category_name': instance.category_name,
      'created_by': instance.created_by,
    };
