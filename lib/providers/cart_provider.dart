import 'package:flutter/material.dart';
import 'package:my_shop/models/cart_order.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartOrder> _cartItems = {};

  int get itemCount => _cartItems.length;

  Map<String, CartOrder> get cartItems => _cartItems;

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
          (item) => CartOrder(
              id: item.id,
              title: item.title,
              quantity: item.quantity + 1,
              price: item.price));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartOrder(
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
}
