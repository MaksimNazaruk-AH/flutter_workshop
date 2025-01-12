import 'package:json_annotation/json_annotation.dart';

part 'basic_character_data.g.dart';

@JsonSerializable()
class BasicCharacterData {
  @JsonKey(name: 'uid')
  final String id;
  final String name;

  BasicCharacterData({
    required this.id,
    required this.name,
  });

  factory BasicCharacterData.fromJson(Map<String, dynamic> json) =>
      _$BasicCharacterDataFromJson(json);
}
