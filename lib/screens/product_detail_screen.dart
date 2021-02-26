import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = "/product_detail";

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final Product product =
        Provider.of<ProductsProvider>(context, listen: false).findProductById(productId);
    return Container(
      child: Center(
        child: Text('Detail of Product :${product.title}'),
      ),
    );
  }
}
