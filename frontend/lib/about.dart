import 'package:flutter/material.dart';
import 'package:life_must_go_on/constants.dart';
import 'package:life_must_go_on/drawer.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectTitle),
      ),
      drawer: MyDrawer(
        curr: "about",
      ),
      body: Text("Very interesting about text."),
    );
  }
}
