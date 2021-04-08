import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_shop/exception/http_exception.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imageUrl,
      this.isFavorite = false});

  Future<void> toggleFavorite(String token) async {
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        "https://flutter-shop-94d0b-default-rtdb.firebaseio.com/products/$id.json?auth=$token";
    final response =
        await http.patch(url, body: json.encode({'isFavorite': isFavorite}));
    if (response.statusCode >= 400) {
      isFavorite = !isFavorite;
      notifyListeners();
      throw HttpException('Some error happen!');
    }
  }
}
