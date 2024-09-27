import 'package:flutter/material.dart';

class TicketListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            Wrap(
          spacing: 10.0, // espace horizontal entre les enfants
          runSpacing: 10.0, // espace vertical entre les lignes/colonnes
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: Center(child: Text('Box 1')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.green,
              child: Center(child: Text('Box 2')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: Center(child: Text('Box 3')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.yellow,
              child: Center(child: Text('Box 4')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.orange,
              child: Center(child: Text('Box 5')),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.purple,
              child: Center(child: Text('Box 6')),
            ),
          ],
        )
        ],
      ),
    );
  }
}






