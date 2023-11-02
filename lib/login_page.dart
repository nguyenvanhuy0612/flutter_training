import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'shopee_app.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (username) {
                Provider.of<LoginModel>(context, listen: false)
                    .setUsername(username);
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (password) {
                Provider.of<LoginModel>(context, listen: false)
                    .setPassword(password);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username =
                    Provider.of<LoginModel>(context, listen: false).username;
                String password =
                    Provider.of<LoginModel>(context, listen: false).password;

                // Check if user exists in registeredUsers list
                bool isAuthenticated = registeredUsers.any((user) =>
                    user.username == username && user.password == password);

                if (isAuthenticated) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShopeeApp()),
                  );
                } else {
                  final snackBar = SnackBar(
                    content: Text('Invalid username or password'),
                    duration: Duration(seconds: 5),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
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
                // Navigate to the forgot password page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: Text('Forgot Password?'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginModel extends ChangeNotifier {
  String _username = '';
  String _password = '';

  String get username => _username;

  String get password => _password;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }
}
