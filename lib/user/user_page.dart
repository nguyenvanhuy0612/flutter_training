import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String username;
  final String email;

  // Constructor to receive user information
  UserPage({required this.username, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Username: $username',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email: $email',
              style: TextStyle(fontSize: 18.0),
            ),
            // Add more user-specific information here
          ],
        ),
      ),
    );
  }
}
