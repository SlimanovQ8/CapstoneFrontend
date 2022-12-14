// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annoucement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Annoucement _$AnnoucementFromJson(Map<String, dynamic> json) => Annoucement(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      priority: json['priority'] as String?,
      quantity: json['quantity'] as int?,
      duration: json['duration'] as String?,
      remaining: json['remaining'] as int?,
      condition: json['condition'] as String?,
      charity_name: json['charity_name'] == null
          ? null
          : User.fromJson(json['charity_name'] as Map<String, dynamic>),
      category_name: json['category_name'] == null
          ? null
          : Category.fromJson(json['category_name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnnoucementToJson(Annoucement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'priority': instance.priority,
      'quantity': instance.quantity,
      'remaining': instance.remaining,
      'duration': instance.duration,
      'condition': instance.condition,
      'charity_name': instance.charity_name,
      'category_name': instance.category_name,
    };
