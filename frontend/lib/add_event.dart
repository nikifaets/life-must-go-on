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
  String category = "Clothes";
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Add new event"),
      ),
      drawer: MyDrawer(
        curr: "add_event",
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  "Test123",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                ),
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
                DropdownButton(
                    value: category,
                    items: [
                      DropdownMenuItem(
                        child: Text("Clothes"),
                        value: "Clothes",
                      ),
                      DropdownMenuItem(
                        child: Text("Toys"),
                        value: "Toys",
                      ),
                      DropdownMenuItem(
                        child: Text("Food"),
                        value: "Food",
                      ),
                      DropdownMenuItem(
                        child: Text("Household"),
                        value: "Household",
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        category = value;
                      });
                    }),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Add event",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
