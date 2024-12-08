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

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Star Wars'),
      ),
      body: ListView(
        children: const [
          CharacterTile('Luke Skywalker'),
          CharacterTile('Darth Vader'),
        ],
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
