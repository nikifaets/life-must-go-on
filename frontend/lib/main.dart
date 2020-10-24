import 'package:flutter/material.dart';
import 'package:life_must_go_on/category_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life must go on',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Life must go on'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// TODO: get categories
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final title = widget.title;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: 10,
        itemBuilder: (context, i) {
          return CategoryTile(name: "Category number: " + i.toString());
        },
      ),
    );
  }
}
