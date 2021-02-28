import 'package:flutter/material.dart';
import 'package:my_shop/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _cartItems = {};

  int get itemCount => _cartItems.length;

  Map<String, Cart> get cartItems => _cartItems;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  void addCartItem(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (item) => Cart(
              id: item.id,
              title: item.title,
              quantity: item.quantity + 1,
              price: item.price));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => Cart(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  void deleteCardItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_cartItems.containsKey(productId)) {
      return;
    } else if (_cartItems[productId].quantity > 1) {
      _cartItems.update(
          productId,
          (existItem) => Cart(
              id: existItem.id,
              title: existItem.title,
              price: existItem.price,
              quantity: existItem.quantity - 1));
    } else {
      _cartItems.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}
