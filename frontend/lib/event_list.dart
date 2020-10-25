import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:life_must_go_on/constants.dart';
import 'package:life_must_go_on/data/event.dart';
import 'package:life_must_go_on/error.dart';
import 'package:life_must_go_on/event_tile.dart';
import 'package:life_must_go_on/loading_screen.dart';
import 'package:http/http.dart' as http;

class EventList extends StatelessWidget {
  final String category;
  final event = dummyEvent;

  EventList({Key key, this.category}) : super(key: key);

  Future<List<EventEntry>> fetchEvents() async {
    final response = await http.get(endpoint + "/label?name=" + category);

    if (response.statusCode == 200) {
      return List<EventEntry>.from(
          jsonDecode(response.body).map((item) => EventEntry.fromJson(item)));
    } else {
      throw Exception('Failed to fetch events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.category),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: snapshot.data.length, // * 2 - 1,
                itemBuilder: (context, i) {
                  // if (i.isOdd) return Divider();

                  //final index = i ~/ 2;
                  return EventTile(event: snapshot.data[i]);
                },
              );
            } else if (snapshot.hasError) {
              return MyError();
            } else {
              return LoadingScreen();
            }
          },
        ),
      ),
    );
  }
}
