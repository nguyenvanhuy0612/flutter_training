import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'register_page.dart';
import 'reset_page.dart';
import '../home/home_page.dart';
import '../user/user_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
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
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;

                final errorMessage =
                    Provider.of<UserProvider>(context, listen: false)
                        .loginUser(username, password);

                if (errorMessage == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text(errorMessage),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPage()),
                );
              },
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
