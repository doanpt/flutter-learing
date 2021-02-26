import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Theme.of(context).accentColor,
            ),
            leading: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
