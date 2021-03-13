import 'package:flutter/material.dart';
import 'package:flutter_ui/models/product.dart';
import 'package:intl/intl.dart';

class ShoppingItem extends StatelessWidget {
  final Product product;
  static final kTextBoxHeight = 65.0;

  ShoppingItem(this.product);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NumberFormat format = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset(
              product.assetName,
              package: product.assetPackage,
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                product.name,
                style: theme.textTheme.headline6,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 4.0),
              Text(
                format.format(product.price),
                style: theme.textTheme.subtitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
