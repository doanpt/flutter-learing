import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    _imageUrlController.addListener(_updateImage);
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
            onPressed: () {},
          )
        ],
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Title",
                hintText: "Enter the title",
              ),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Price",
                hintText: "Enter the price",
              ),
              textInputAction: TextInputAction.next,
              focusNode: _priceFocusNode,
            ),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Title",
                hintText: "Enter the description",
              ),
              textInputAction: TextInputAction.newline,
              focusNode: _descriptionFocusNode,
            ),
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
                    ),
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
