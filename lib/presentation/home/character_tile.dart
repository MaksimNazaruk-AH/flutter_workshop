import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.name,
    super.key,
    this.onTap,
  });

  final String name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: onTap,
    );
  }
}
