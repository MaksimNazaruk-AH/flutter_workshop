import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _service = StarWarsService();
  List<String> _names = [];

  @override
  void initState() {
    super.initState();
    _service.fetchPeople().then((names) {
      setState(() {
        _names = names;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Star Wars'),
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (BuildContext context, int index) => CharacterTile(
          name: _names[index],
        ),
      ),
    );
  }
}

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
    );
  }
}

const starWarsBaseUrl = 'https://www.swapi.tech/api/';

class StarWarsService {
  Future<List<String>> fetchPeople() async {
    final response = await http.get(Uri.parse('${starWarsBaseUrl}people'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json is Map<String, dynamic>) {
        return _parseCharacters(json).map((e) => e.name).toList();
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
