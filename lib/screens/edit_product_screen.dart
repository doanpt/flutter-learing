import 'package:flutter/material.dart';
import 'package:my_shop/models/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = "/edit-product";

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  Product _editedProduct =
      Product(id: null, description: "", imageUrl: "", price: 0, title: "");
  bool _isValid = true;

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(_updateImage);
  }

  void _saveForm() {
    _form.currentState.save();
    if(_isValid) {
      print(_editedProduct.title);
      print(_editedProduct.description);
      print(_editedProduct.price);
      print(_editedProduct.imageUrl);
    } else {
      print("data invalid");
    }
  }

  @override
  void dispose() {
    _imageUrlController.removeListener(_updateImage);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImage() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState.validate();
              _saveForm();
            },
          )
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Title",
                hintText: "Enter the title",
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_priceFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  _isValid = false;
                  return "Please enter the title";
                }
                return null;
              },
              onSaved: (value) => {
                _editedProduct = Product(
                    id: null,
                    title: value,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl)
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Price",
                hintText: "Enter the price",
              ),
              textInputAction: TextInputAction.next,
              focusNode: _priceFocusNode,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_descriptionFocusNode);
              },
              validator: (value) {
                if (value.isEmpty) {
                  _isValid = false;
                  return "Please enter the price";
                }
                if (double.tryParse(value) == null) {
                  return "Please enter valid number!";
                }
                return null;
              },
              onSaved: (value) => {
                _editedProduct = Product(
                    id: null,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value),
                    imageUrl: _editedProduct.imageUrl)
              },
            ),
            TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: "Description",
                  hintText: "Enter the description",
                ),
                textInputAction: TextInputAction.newline,
                focusNode: _descriptionFocusNode,
                validator: (value) {
                  if (value.isEmpty) {
                    _isValid = false;
                    return "Please enter the description";
                  }
                  return null;
                },
                onSaved: (value) => {
                      _editedProduct = Product(
                          id: null,
                          title: _editedProduct.title,
                          description: value,
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl)
                    }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black)),
                    width: 100,
                    height: 100,
                    child: _imageUrlController.text.isEmpty
                        ? Center(child: Text('Enter URL'))
                        : FittedBox(
                            child: Image.network(
                              _imageUrlController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "URL",
                          hintText: "Enter the url",
                        ),
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            _isValid = false;
                            return "Please enter the url";
                          }
                          return null;
                        },
                        onSaved: (value) => {
                              _editedProduct = Product(
                                  id: null,
                                  title: _editedProduct.title,
                                  description: _editedProduct.description,
                                  price: _editedProduct.price,
                                  imageUrl: value)
                            }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
