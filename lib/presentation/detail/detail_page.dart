import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/models/basic_character_data.dart';
import 'package:workshop/data/models/character_details.dart';
import 'package:workshop/data/services/favourites_service.dart';
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
  Completer<CharacterDetails>? _detailsCompleter;

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  void _fetchDetails() {
    final completer = Completer<CharacterDetails>();
    Provider.of<StarWarsService>(context, listen: false)
        .fetchCharacterDetails(widget.basicCharacterData.id)
        .then(completer.complete)
        .onError(completer.completeError);

    _detailsCompleter = completer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.basicCharacterData.name),
        actions: [
          IconButton(
            icon: Icon(
              Provider.of<FavouritesService>(context)
                      .isFavourite(widget.basicCharacterData.id)
                  ? Icons.star
                  : Icons.star_border,
            ),
            onPressed: () {
              Provider.of<FavouritesService>(context, listen: false)
                  .toggleFavourite(widget.basicCharacterData.id);
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: _detailsCompleter?.future,
          builder: (context, detailsSnapshot) {
            switch (detailsSnapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const _LoadingBody();
              case ConnectionState.done:
                if (detailsSnapshot.hasError || !detailsSnapshot.hasData) {
                  return const _ErrorBody();
                } else {
                  return _DetailsBody(
                    id: widget.basicCharacterData.id,
                    details: detailsSnapshot.data!,
                  );
                }
              default:
                return const SizedBox.shrink();
            }
          }),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 64.0,
          ),
          Text('Something went wrong'),
        ],
      ),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  final String id;
  final CharacterDetails details;

  const _DetailsBody({
    required this.id,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/img/$id.jpg'),
        Text('Name: ${details.properties.name}'),
        Text('Height: ${details.properties.height}'),
        Text('Mass: ${details.properties.mass}'),
        Text('Birth year: ${details.properties.birthYear}'),
      ],
    );
  }
}
