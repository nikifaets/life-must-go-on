import 'package:flutter/material.dart';
import 'package:life_must_go_on/about.dart';
import 'package:life_must_go_on/add_event.dart';
import 'package:life_must_go_on/constants.dart';
import 'package:life_must_go_on/main.dart';

class MyDrawer extends StatelessWidget {
  final String curr;

  const MyDrawer({Key key, this.curr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeTile = ListTile(
      title: Text('Home'),
      onTap: () {
        Navigator.of(context).pop();
        if (this.curr != 'home') {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return MyHomePage();
          }));
        }
      },
    );
    final aboutTile = ListTile(
      title: Text('About'),
      onTap: () {
        Navigator.of(context).pop();
        if (this.curr != 'about') {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return AboutPage();
          }));
        }
      },
    );
    final addEventTile = ListTile(
      title: Text('Add your event'),
      onTap: () {
        Navigator.of(context).pop();
        if (this.curr != 'add_event') {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return AddEvent();
          }));
        }
      },
    );
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              projectTitle,
              style: Theme.of(context).textTheme.headline4,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          homeTile,
          aboutTile,
          addEventTile
        ],
      ),
    );
  }
}
