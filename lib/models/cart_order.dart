import 'package:flutter/material.dart';

class CartOrder {
  final String id;
  final String title;
  int quantity;
  final double price;

  CartOrder(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}
