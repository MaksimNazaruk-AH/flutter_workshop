import 'package:flutter/material.dart';

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
