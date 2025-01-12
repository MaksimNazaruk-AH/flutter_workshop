// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterDetails _$CharacterDetailsFromJson(Map<String, dynamic> json) =>
    CharacterDetails(
      properties: CraracterProperties.fromJson(
          json['properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharacterDetailsToJson(CharacterDetails instance) =>
    <String, dynamic>{
      'properties': instance.properties,
    };

CraracterProperties _$CraracterPropertiesFromJson(Map<String, dynamic> json) =>
    CraracterProperties(
      name: json['name'] as String,
      birthYear: json['birth_year'] as String,
      height: json['height'] as String,
      mass: json['mass'] as String,
    );

Map<String, dynamic> _$CraracterPropertiesToJson(
        CraracterProperties instance) =>
    <String, dynamic>{
      'name': instance.name,
      'birth_year': instance.birthYear,
      'height': instance.height,
      'mass': instance.mass,
    };
