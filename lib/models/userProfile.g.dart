// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as int?,
      location: json['location'] as String?,
      phone: json['phone'] as String?,
      numOfDonation: json['numOfDonation'] as int?,
      points: json['points'] as int?,
      user: json['user'] as int?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'phone': instance.phone,
      'numOfDonation': instance.numOfDonation,
      'points': instance.points,
      'user': instance.user,
    };
