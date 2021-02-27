import 'package:flutter/material.dart';
import 'package:my_shop/providers/order_provider.dart';
import 'package:my_shop/widgets/oder_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders";
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrderProvider>(context).orders;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(orders[index]),
        itemCount: orders.length,
      ),
    );
  }
}
