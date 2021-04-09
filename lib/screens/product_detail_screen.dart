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
        Provider.of<ProductsProvider>(context, listen: false)
            .findProductById(productId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${product.title}'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,//keep app bar if scroll up to min
            flexibleSpace: FlexibleSpaceBar(
              title: Text('${product.title}'),
              background: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${product.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${product.description}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 1000,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
