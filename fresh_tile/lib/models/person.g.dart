// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      firstName: json['FIRST_NAME'] as String,
      lastName: json['LAST_NAME'] as String,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'FIRST_NAME': instance.firstName,
      'LAST_NAME': instance.lastName,
    };
