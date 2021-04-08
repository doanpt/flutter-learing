import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_shop/exception/http_exception.dart';
import 'package:my_shop/models/cart.dart';
import 'package:my_shop/models/order.dart';
import 'package:http/http.dart' as http;

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => _orders;

  final String _authToken;
  final String userId;

  OrderProvider(this._authToken, this.userId);

  Future<void> fetchAndSetOrders() async {
    final url =
        "https://flutter-shop-94d0b-default-rtdb.firebaseio.com/orders/$userId.json?auth=$_authToken";
    final response = await http.get(url);
    print(response.body);
    final List<Order> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(Order(
        id: orderId,
        amount: orderData['amount'],
        dateTime: DateTime.parse(orderData['dateTime']),
        products: (orderData['products'] as List<dynamic>)
            .map((item) => Cart(
                  id: item['id'],
                  title: item['title'],
                  quantity: item['quantity'],
                  price: item['price'],
                ))
            .toList(),
      ));
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<Cart> cartProducts, double total) async {
    try {
      final timestamp = DateTime.now().toIso8601String();
      final url =
          "https://flutter-shop-94d0b-default-rtdb.firebaseio.com/orders/$userId.json?auth=$_authToken";
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'dateTime': timestamp,
            'products': cartProducts
                .map((product) => {
                      'id': product.id,
                      'title': product.title,
                      'quantity': product.quantity,
                      'price': product.price
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          Order(
              id: json.decode(response.body)['name'],
              amount: total,
              dateTime: DateTime.now(),
              products: cartProducts));
      notifyListeners();
    } catch (e) {
      print(e.toString());
      throw HttpException('Something wrong when make a order');
    }
  }
}
