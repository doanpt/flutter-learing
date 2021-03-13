import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:intl/intl.dart';

class ShoppingItem extends StatelessWidget {
  final Product product;

  ShoppingItem(this.product);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat format = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name),
                SizedBox(height: 8.0),
                Text(
                  format.format(product.price),
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
