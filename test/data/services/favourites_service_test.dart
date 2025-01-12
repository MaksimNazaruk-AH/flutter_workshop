import 'package:flutter_test/flutter_test.dart';
import 'package:workshop/data/services/favourites_service.dart';

const _testId = '1';

void main() {
  group('FavouritesService', () {
    late FavouritesService service;

    setUp(() {
      service = FavouritesService();
    });

    test('isFavourite returns false when id is not in favourites', () {
      expect(service.isFavourite(_testId), false);
    });

    test('toggleFavourite adds id to favourites when not present', () {
      service.toggleFavourite(_testId);
      expect(service.isFavourite(_testId), true);
    });

    test('toggleFavourite removes id from favourites when present', () {
      service.toggleFavourite(_testId);
      service.toggleFavourite(_testId);
      expect(service.isFavourite(_testId), false);
    });
  });
}
