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
    return RaisedButton(
      onPressed: () {
        _launchURL(event.link);
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              event.imgUrl,
            ),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.1),
              BlendMode.dstATop,
            ),
          ),
        ),
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            event.name,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Container(
            margin: EdgeInsets.only(top: 15),
            child: Text(event.description),
          ),
        ),
      ),
    );
  }
}
