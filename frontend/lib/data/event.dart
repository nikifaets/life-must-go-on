import 'dart:core';

class EventEntry {
  String name;
  String description;
  String link;
  String imgUrl;
  DateTime beginning;
  DateTime ending;

  EventEntry(
      {this.name,
      this.description,
      this.beginning,
      this.ending,
      this.link,
      this.imgUrl});

  factory EventEntry.fromJson(Map<String, dynamic> json) {
    var e = EventEntry(
      name: json['name'],
      description: json['description'],
      link: json['url'],
      imgUrl: json['imgUrl'],
    );
    if (e.imgUrl == null) {
      e.imgUrl = "";
    }
    return e;
  }
}

final dummyEvent = EventEntry(
    name: "Dummy event",
    description: "Some very interesting description",
    link: "https://google.com",
    beginning: DateTime.parse("2020-07-20 20:20:04Z"),
    ending: DateTime.parse("2020-07-21 20:20:04Z"));
