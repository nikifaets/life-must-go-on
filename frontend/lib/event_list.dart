import 'package:flutter/material.dart';
import 'package:life_must_go_on/data/event.dart';
import 'package:life_must_go_on/error.dart';
import 'package:life_must_go_on/event_tile.dart';
import 'package:life_must_go_on/loading_screen.dart';

// TODO: get events
class EventList extends StatelessWidget {
  final String category;
  final event = dummyEvent;

  EventList({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.category),
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
              Duration(seconds: 0), () => [dummyEvent, dummyEvent, dummyEvent]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                padding: EdgeInsets.all(16.0),
                itemCount: snapshot.data.length * 2 - 1,
                itemBuilder: (context, i) {
                  if (i.isOdd) return Divider();

                  final index = i ~/ 2;
                  return EventTile(event: snapshot.data[index]);
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
