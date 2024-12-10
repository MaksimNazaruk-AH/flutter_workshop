import 'package:flutter/material.dart';
import 'package:workshop/data/models/basic_character_data.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
    required this.basicCharacterData,
  });

  final BasicCharacterData basicCharacterData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(basicCharacterData.name),
      ),
      body: Center(
        child: Text(basicCharacterData.name),
      ),
    );
  }
}
