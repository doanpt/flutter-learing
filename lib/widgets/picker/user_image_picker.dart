import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
   final void Function(File image)  imagePickFn;

   UserImagePicker(this.imagePickFn);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 300, maxHeight: 300);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.imagePickFn(_image);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: _image == null ? AssetImage("images/profile.png"): FileImage(_image),
        ),
        ElevatedButton.icon(
          onPressed: getImage,
          icon: Icon(Icons.image),
          label: Text('Add an Image'),
        ),
      ],
    );
  }
}
