import 'package:flutter/foundation.dart';
import 'package:great_places_app/models/places.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
