import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';

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
                  onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
