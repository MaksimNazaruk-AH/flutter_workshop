import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/models/basic_character_data.dart';
import 'package:workshop/data/services/favourites_service.dart';
import 'package:workshop/data/services/star_wars_service.dart';
import 'package:workshop/presentation/detail/detail_page.dart';
import 'package:workshop/presentation/home/character_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BasicCharacterData> _characters = [];

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    final characters =
        await Provider.of<StarWarsService>(context, listen: false)
            .fetchPeople();

    setState(() {
      _characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Star Wars'),
      ),
      body: _characters.isNotEmpty
          ? ListView.builder(
              itemCount: _characters.length,
              itemBuilder: (BuildContext context, int index) => CharacterTile(
                name: _characters[index].name,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        DetailPage(basicCharacterData: _characters[index]),
                  ),
                ),
                isFavourite: Provider.of<FavouritesService>(context)
                    .isFavourite(_characters[index].id),
                onFavouriteTap: () {
                  Provider.of<FavouritesService>(context, listen: false)
                      .toggleFavourite(_characters[index].id);
                },
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
