import 'package:flutter/material.dart';
import 'package:my_shop/models/cart_order.dart';

class CartItem extends StatelessWidget {
  final CartOrder cart;

  CartItem(this.cart);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: FittedBox(
              child: Text('\$${cart.price.toString()}'),
            ),
          ),
        ),
        title: Text('${cart.title.toString()}'),
        subtitle: Text('Total \$${cart.price * cart.quantity}'),
        trailing: Text('${cart.quantity} x'),
      ),
    );
  }
}
