import 'package:flutter/material.dart';
import 'package:life_must_go_on/drawer.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String name = "";
  String description = "";
  String link = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add new event"),
      ),
      drawer: MyDrawer(
        curr: "add_event",
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(labelText: "Name"),
                  onChanged: (value) {
                    setState(() {
                      this.name = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(labelText: "Description"),
                  onChanged: (value) {
                    setState(() {
                      this.description = value;
                    });
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(labelText: "Link"),
                  onChanged: (value) {
                    setState(() {
                      this.link = value;
                    });
                  },
                ),
              ),
              // Text("$name $description $link")
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
