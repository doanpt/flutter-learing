import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:great_places_app/heplers/db_helper.dart';
import 'package:great_places_app/models/places.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      location: null,
      title: title,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(
        'user_place', {'id': newPlace.id, 'title': title, 'image': image.path});
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_place');
    _items = dataList
        .map(
          (item) =>
          Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
    )
        .toList();
    notifyListeners();
  }
}
