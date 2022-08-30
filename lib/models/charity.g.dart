// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Charity _$CharityFromJson(Map<String, dynamic> json) => Charity(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      phone: json['phone'] as String?,
      location: json['location'] as String?,
      charity: json['charity'] as int?,
    );

Map<String, dynamic> _$CharityToJson(Charity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'rating': instance.rating,
      'phone': instance.phone,
      'location': instance.location,
      'charity': instance.charity,
    };
