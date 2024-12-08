import 'package:flutter/material.dart';

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
          _names[index],
        ),
      ),
    );
  }
}

class CharacterTile extends StatelessWidget {
  const CharacterTile(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
    );
  }
}

class StarWarsService {
  Future<List<String>> fetchPeople() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );

    return [
      'Luke Skywalker',
      'Darth Vader',
      'Princess Leia',
      'C-3PO',
      'R2-D2',
    ];
  }
}
