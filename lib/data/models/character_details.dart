class CharacterDetails {
  final String name;
  final String birthYear;
  final String height;
  final String mass;

  CharacterDetails({
    required this.name,
    required this.birthYear,
    required this.height,
    required this.mass,
  });

  CharacterDetails.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        birthYear = json['birth_year'],
        height = json['height'],
        mass = json['mass'];
}
