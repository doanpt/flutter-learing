import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:flutter_ui/models/products_repository.dart';
import 'package:flutter_ui/widgets/asymmetric_view.dart';

class HomeShoppingScreen extends StatelessWidget {
  final List<Product> products = ProductsRepository.loadProducts(Category.all);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'Menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      // body: GridView.builder(
      //   gridDelegate:
      //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      //   itemBuilder: (ctx, index) => ProductItem(products[index]),
      //   itemCount: products.length,
      // ),
      body: AsymmetricView(
          products: ProductsRepository.loadProducts(Category.all)),
    );
  }
}
