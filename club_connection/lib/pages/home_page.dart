import 'package:club_connection/pages/custom_names.dart';
import 'package:club_connection/pages/random_names.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Club Connect', style: TextStyle(fontSize: 40),),

            SizedBox(height: 20,),


            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomNamesPage()),
              );
              },

              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
              ),
              child: Text('Random Names'),
            ),

            SizedBox(height: 20,),
            


            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomNamesPage()),
              );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green[900],
              ),

              child: Text('Custom Names'),
            ),


          ],
        ),
      ),
    );
  }
}