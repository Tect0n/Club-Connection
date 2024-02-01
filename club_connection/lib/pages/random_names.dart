import 'package:flutter/material.dart';

class RandomNamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: BackButton(
                onPressed: () {
                  Navigator.pop(context);  // Navigate back to the previous page
                },
              ),
            ),
            Center(
              child: Text('Welcome to Random Names Page!'),
            ),
          ],
        ),
      ),
    );
  }
}