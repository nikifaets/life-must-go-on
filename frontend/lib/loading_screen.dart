import 'package:flutter/material.dart';
import 'package:life_must_go_on/constants.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(projectTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(),
              width: 100,
              height: 100,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Зареждане'),
            )
          ],
        ),
      ),
    );
  }
}
