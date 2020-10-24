import 'package:flutter/material.dart';
import 'package:life_must_go_on/event_list.dart';

// TODO: make name to be custom data type
class CategoryTile extends StatelessWidget {
  final name;

  const CategoryTile({Key key, this.name}) : super(key: key);

  void navigateToCategory(BuildContext context, String name) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return EventList(
        category: name,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: FlatButton(
        padding: EdgeInsets.all(15),
        onPressed: () {
          navigateToCategory(context, this.name);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).backgroundColor,
        child: Text(
          this.name,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
