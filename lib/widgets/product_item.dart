import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: Icon(Icons.favorite),
        leading: Icon(Icons.shopping_cart),
      ),
    );
  }
}
