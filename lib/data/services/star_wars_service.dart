import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:workshop/data/models/basic_character_data.dart';

const starWarsBaseUrl = 'https://www.swapi.tech/api/';

class StarWarsService {
  Future<List<BasicCharacterData>> fetchPeople() async {
    final response = await http.get(Uri.parse('${starWarsBaseUrl}people'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json is Map<String, dynamic>) {
        return _parseCharacters(json);
      }
    }

    return [];
  }

  List<BasicCharacterData> _parseCharacters(Map<String, dynamic> json) {
    final results = json['results'];
    if (results is List<dynamic>) {
      return results
          .map(
            (json) => BasicCharacterData.fromJson(json as Map<String, dynamic>),
          )
          .toList();
    } else {
      return [];
    }
  }
}
