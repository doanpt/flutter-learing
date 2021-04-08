import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:my_shop/screens/shopping_cart_screen.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:my_shop/widgets/badge.dart';
import 'package:my_shop/widgets/product_item.dart';
import 'package:provider/provider.dart';

enum FilterOptions { FavoriteOnly, All }

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = "/product-overview";

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool isFavoriteOnly = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // README this only work if listen:false is added
    // Provider.of<ProductsProvider>(context, listen: false).fetchProductsData();

    //This is second ways to fetch data
    // Future.delayed(Duration.zero).then((value){
    //   Provider.of<ProductsProvider>(context).fetchProductsData();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isLoading = true;
      Provider.of<ProductsProvider>(context).fetchProductsData().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products =
        isFavoriteOnly ? productsData.favorites : productsData.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          Consumer<CartProvider>(
            builder: (_, cart, widget) => Badge(
              child: widget,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, ShoppingCartScreen.routeName);
              },
            ),
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
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                value: products[index],
                child: ProductItem(),
              ),
            ),
    );
  }
}
