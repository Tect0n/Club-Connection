// ignore_for_file: prefer_const_constructors

import 'package:club_connection/pages/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController user1Controller = TextEditingController(text: 'Cat');
  final TextEditingController user2Controller = TextEditingController(text: 'Dog');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            // Title
            Text('Club Connect', style: TextStyle(fontSize: 40),),



            SizedBox(height: 50,),


            // User 1 input field


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: user1Controller,
                cursorColor: Color.fromARGB(176, 233, 25, 25),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(176, 233, 25, 25), width: 2.0),
                  ),
                  labelText: 'User 1',
                  labelStyle: TextStyle(color: Color.fromARGB(176, 233, 25, 25)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(176, 233, 25, 25), width: 2.0),
                  ),
                ),
              ),
            ),


            SizedBox(height: 50,),

            // User 2 input field

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: user2Controller,
                cursorColor: Colors.deepPurple,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                  ),
                  labelText: 'User 2',
                  labelStyle: TextStyle(color: Colors.deepPurple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2.0),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50,),

            // Button to start chat

            Container(
              height: 60, // set height of the button
              width: double.infinity, // set width of the button
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40.0), // set margin of the button
              child: ElevatedButton(
                onPressed: () {
                  // Check if user 1 and user 2 are not empty
                  if (user1Controller.text.isEmpty || user2Controller.text.isEmpty) {
                    // Show alert dialog
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter both user names'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );

                  } else {
                    // Navigate to chat page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage(
                        user1 : user1Controller.text,
                        user2 : user2Controller.text,
                      ),
                    ),
                    );
                    }
                },

                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                ),
                child: Text('Start Chat', style: TextStyle(fontSize: 20)), // increase text size
              ),
            ),


          ],
        ),
      ),
    );
  }
}