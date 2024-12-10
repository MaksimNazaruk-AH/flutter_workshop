class BasicCharacterData {
  final String id;
  final String name;

  BasicCharacterData({
    required this.id,
    required this.name,
  });

  BasicCharacterData.fromJson(Map<String, dynamic> json)
      : id = json['uid'],
        name = json['name'];
}
