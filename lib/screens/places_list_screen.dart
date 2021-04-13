import 'package:flutter/material.dart';
import 'package:great_places_app/providers/PlacesProvider.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<PlacesProvider>(
        builder: (ctx, places, c) => places.items.length <= 0
            ? c
            : ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[index].image),
                  ),
                  title: Text(places.items[index].title),
                ),
                itemCount: places.items.length,
              ),
        child: Center(
          child: Text('There are no Places'),
        ),
      ),
    );
  }
}
