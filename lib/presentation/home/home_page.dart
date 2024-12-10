import 'package:flutter/material.dart';
import 'package:workshop/data/services/star_wars_service.dart';
import 'package:workshop/presentation/home/character_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
