import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.grey,
            width: 1,
          )),
          height: 170,
          alignment: Alignment.center,
          width: double.infinity,
          child: _previewImageUrl == null
              ? Text(
                  'No location chosen',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () async {},
              icon: Icon(Icons.location_on),
              label: Text('Current location'),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(
              onPressed: () async {},
              icon: Icon(Icons.map),
              label: Text('Select on Map'),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
