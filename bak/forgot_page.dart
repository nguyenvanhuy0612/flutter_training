import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic to send a password recovery email here
                // Typically, you would send a recovery email to the provided email address
                // and then show a confirmation message
              },
              child: Text('Send Recovery Email'),
            ),
          ],
        ),
      ),
    );
  }
}
