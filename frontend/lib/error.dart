import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      'Error :\'(',
      style: Theme.of(context)
          .textTheme
          .headline1
          .copyWith(color: Colors.redAccent, fontWeight: FontWeight.bold),
    ));
  }
}
