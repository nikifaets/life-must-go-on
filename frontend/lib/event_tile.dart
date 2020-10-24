import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:life_must_go_on/data/event.dart';

class EventTile extends StatelessWidget {
  final EventEntry event;

  const EventTile({Key key, this.event}) : super(key: key);

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        _launchURL(event.link);
      },
      child: ListTile(
        title: Text(event.name),
        subtitle: Text(event.description),
      ),
    );
  }
}
