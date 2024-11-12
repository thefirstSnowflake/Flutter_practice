import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:navigation_7_6/albums.dart';
import 'package:flutter/foundation.dart';

List<Album> parseAlbums(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}

Future<List<Album>> fetchFileFromAssets(String assetsPath) async {
  final response = await rootBundle.loadString(assetsPath).then((file) => file);

  return compute(parseAlbums, response);
}

void main() {
  //Future<List<Album>> test = fetchFileFromAssets('jsons/artists.json');
  fetchFileFromAssets('jsons/artists.json').then((value) {
    for (var obj in value) print(obj.name);
  });
}
