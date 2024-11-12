class Album {
  final String name;
  final String link;
  final String about;

  Album({this.name, this.link, this.about});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      name: json['name'] as String,
      link: json['link'] as String,
      about: json['about'] as String,
    );
  }
}