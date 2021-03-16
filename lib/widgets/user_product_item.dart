import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:my_shop/screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final Product product;

  UserProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(product.imageUrl),
        ),
        title: Text('${product.title}'),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditProductScreen.routeName,
                        arguments: product.id);
                  }),
              IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () async{
                    try {
                      await Provider.of<ProductsProvider>(context, listen: false)
                          .deleteProduct(product.id);
                    } catch (e) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text("Deleting failed!")),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
