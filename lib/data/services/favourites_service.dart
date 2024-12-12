import 'package:flutter/foundation.dart';

class FavouritesService extends ChangeNotifier {
  final _favouriteIds = <String>[];

  bool isFavourite(String id) => _favouriteIds.contains(id);

  void toggleFavourite(String id) {
    if (_favouriteIds.contains(id)) {
      _favouriteIds.remove(id);
    } else {
      _favouriteIds.add(id);
    }
    notifyListeners();
  }
}
