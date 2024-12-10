import 'package:flutter/material.dart';
import 'package:workshop/data/models/basic_character_data.dart';
import 'package:workshop/data/models/character_details.dart';
import 'package:workshop/data/services/star_wars_service.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.basicCharacterData,
  });

  final BasicCharacterData basicCharacterData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _service = StarWarsService();
  CharacterDetails? _details;

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  Future<void> _fetchDetails() async {
    final details =
        await _service.fetchCharacterDetails(widget.basicCharacterData.id);

    setState(() {
      _details = details;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.basicCharacterData.name),
      ),
      body: _details != null
          ? _DetailsBody(details: _details!)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  final CharacterDetails details;

  const _DetailsBody({
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name: ${details.name}'),
        Text('Height: ${details.height}'),
        Text('Mass: ${details.mass}'),
        Text('Birth year: ${details.birthYear}'),
      ],
    );
  }
}
