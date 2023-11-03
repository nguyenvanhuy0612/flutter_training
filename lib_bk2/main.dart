import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user/user_provider.dart'; // Import the UserProvider class
import 'login/login_page.dart'; // Import the LoginPage class

void main3() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: LoginApp(),
    ),
  );
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
