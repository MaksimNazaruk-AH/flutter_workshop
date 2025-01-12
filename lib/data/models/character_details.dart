import 'package:json_annotation/json_annotation.dart';

part 'character_details.g.dart';

@JsonSerializable()
class CharacterDetails {
  final CraracterProperties properties;

  CharacterDetails({required this.properties});

  factory CharacterDetails.fromJson(Map<String, dynamic> json) =>
      _$CharacterDetailsFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CraracterProperties {
  final String name;
  final String birthYear;
  final String height;
  final String mass;

  CraracterProperties({
    required this.name,
    required this.birthYear,
    required this.height,
    required this.mass,
  });

  factory CraracterProperties.fromJson(Map<String, dynamic> json) =>
      _$CraracterPropertiesFromJson(json);
}
