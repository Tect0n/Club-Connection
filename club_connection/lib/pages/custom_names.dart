import 'package:flutter/material.dart';

class CustomNamesPage extends StatelessWidget {
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
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'User 1',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green, width: 2.0),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 50.0),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'User 2',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}