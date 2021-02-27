import 'package:flutter/material.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

enum FilterOptions { FavoriteOnly, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool isFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        isFavoriteOnly ? productsData.favorites : productsData.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        actions: [
          Badge(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {},
            ),
            value: "1",
          ),
          PopupMenuButton(
            itemBuilder: (c) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FilterOptions.FavoriteOnly,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (index) {
              if (index == FilterOptions.FavoriteOnly) {
                isFavoriteOnly = true;
              } else {
                isFavoriteOnly = false;
              }
              setState(() {});
            },
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 3 / 4,
        ),
        itemCount: products.length,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        ),
      ),
    );
  }
}
