import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({
    required this.name,
    super.key,
    this.onTap,
    this.isFavourite = false,
    this.onFavouriteTap,
  });

  final String name;
  final VoidCallback? onTap;
  final bool isFavourite;
  final VoidCallback? onFavouriteTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: IconButton(
        icon: Icon(
          isFavourite ? Icons.star : Icons.star_border,
        ),
        onPressed: onFavouriteTap,
      ),
      onTap: onTap,
    );
  }
}
