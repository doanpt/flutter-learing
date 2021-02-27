import 'package:flutter/material.dart';
import 'package:my_shop/models/cart_item.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  void addCartItem(String id, String title, double price) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
          id,
          (item) => CartItem(
              id: item.id,
              title: item.title,
              quantity: item.quantity + 1,
              price: item.price));
    } else {
      _cartItems.putIfAbsent(DateTime.now().toString(),
          () => CartItem(id: id, title: title, quantity: 1, price: price));
    }
    notifyListeners();
  }
}
