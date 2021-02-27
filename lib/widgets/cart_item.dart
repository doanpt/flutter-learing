import 'package:flutter/material.dart';
import 'package:my_shop/models/cart_order.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final CartOrder cart;
  final String productId;

  CartItem(this.cart, this.productId);

  @override
  Widget build(BuildContext context) {
    print("card id ${cart.id}");
    return Dismissible(
      key: ValueKey(cart.id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        padding: EdgeInsets.only(right: 20),
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .deleteCardItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text('\$${cart.price.toStringAsFixed(2)}'),
              ),
            ),
          ),
          title: Text('${cart.title.toString()}'),
          subtitle: Text(
              'Total \$${(cart.price * cart.quantity).toStringAsFixed(2)}'),
          trailing: Text('${cart.quantity} x'),
        ),
      ),
    );
  }
}
