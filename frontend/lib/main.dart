import 'package:flutter/material.dart';
import 'package:life_must_go_on/category_tile.dart';
import 'package:life_must_go_on/constants.dart';
import 'package:life_must_go_on/drawer.dart';
import 'package:life_must_go_on/error.dart';
import 'package:life_must_go_on/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: projectTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
          Duration(seconds: 0), () => ["Clothes", "Toys", "Food", "Household"]),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(projectTitle),
            ),
            drawer: MyDrawer(
              curr: "home",
            ),
            body: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) {
                return CategoryTile(name: snapshot.data[i]);
              },
            ),
          );
        } else if (snapshot.hasError) {
          return MyError();
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}
