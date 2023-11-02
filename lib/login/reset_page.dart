import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user/user_provider.dart';

class ResetPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final newPassword = newPasswordController.text;
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);

                if (userProvider.users
                    .any((user) => user.username == username)) {
                  // Update the user's password
                  userProvider.changePassword(username, newPassword);

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Password Reset Successful'),
                        content:
                            Text('Your password has been reset successfully!'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                              Navigator.pop(
                                  context); // Return to the login page
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'Invalid username. Please enter a valid username.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
