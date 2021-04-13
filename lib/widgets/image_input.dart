import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  Function _pickFunc;

  ImageInput(this._pickFunc);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _imageFile;

  Future _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.getImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _imageFile = File(imageFile.path);
    });
    final appDir = await syspath.getApplicationDocumentsDirectory();
    final finalName = path.basename(imageFile.path);
    print('File is:${appDir.path}/$finalName');
    final savedImage = await _imageFile.copy('${appDir.path}/$finalName');
    widget._pickFunc(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 120,
          child: _imageFile != null
              ? Image.file(
                  _imageFile,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text('No Image Taken'),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              _takePicture();
            },
            icon: Icon(Icons.camera),
            label: Text('Take picture'),
          ),
        ),
      ],
    );
  }
}
