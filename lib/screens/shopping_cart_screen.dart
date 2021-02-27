import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ShoppingCartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Chip(
                      label: Text(
                        '\$ ${cart.totalAmount.toString()}',
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
