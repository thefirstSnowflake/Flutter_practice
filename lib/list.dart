import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:navigation_7_6/albums.dart';

class AlbumList extends StatelessWidget {
  final List<Album>? album;
  AlbumList({Key? key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: album == null ? 0 : album!.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(
                // Read the name field value and set it in the Text widget
                album![index].name!, textAlign: TextAlign.center,
                // set some style to text
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.of(context).pushNamed('/description', arguments: {
                  'description': album![index].about,
                  'album': album![index].name
                });
              },
            ),
          );
        });
  }
}
