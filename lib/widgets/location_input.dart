import 'package:flutter/material.dart';
import 'package:great_places_app/heplers/location_helper.dart';
import 'package:great_places_app/screens/map_screen.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> getCurrentLocation() async {
    final locData = await Location().getLocation();
    final mapPreviewUrl = LocationHelper.generateLocationPreviewImage(
        longitude: locData.longitude, latitude: locData.latitude);
    setState(() {
      _previewImageUrl = mapPreviewUrl;
    });
  }

  Future<void> selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isSelecting: true),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
  }

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
              onPressed: () async {
                getCurrentLocation();
              },
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
              onPressed: () async {
                selectOnMap();
              },
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
