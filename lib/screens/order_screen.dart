import 'package:flutter/material.dart';
import 'package:my_shop/providers/order_provider.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:my_shop/widgets/oder_item.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    print("build orders");
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Order'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<OrderProvider>(context, listen: false)
            .fetchAndSetOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.error != null) {
              return Center(
                child: Text("An Error occurred!"),
              );
            } else {
              return Consumer<OrderProvider>(
                builder: (context, ordersData, child) =>
                    ordersData.orders.isEmpty
                        ? Center(
                            child: Text('No ordered'),
                          )
                        : ListView.builder(
                            itemBuilder: (context, index) =>
                                OrderItem(ordersData.orders[index]),
                            itemCount: ordersData.orders.length,
                          ),
              );
            }
          }
        },
      ),
    );
  }
}
