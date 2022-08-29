// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      userID: json['userID'] as int?,
      first_name: json['first_name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      description: json['description'] as String?,
      charityname: json['charityname'] as String?,
      isCharity: json['isCharity'] as bool?,
      phone: json['phone'] as String?,
      location: json['location'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.first_name,
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
      'isCharity': instance.isCharity,
      'location': instance.location,
      'description': instance.description,
      'charityname': instance.charityname,
      'phone': instance.phone,
      'rating': instance.rating,
      'userID': instance.userID,
    };
