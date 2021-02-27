import 'package:flutter/material.dart';
import 'package:my_shop/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  String get itemCount => _cartItems.length.toString();

  Map<String, CartItem> get cartItems => _cartItems;

  void addCartItem(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (item) => CartItem(
              id: item.id,
              title: item.title,
              quantity: item.quantity + 1,
              price: item.price));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }
}
