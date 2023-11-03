import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../lib/login/login_provider.dart';
import '../lib/user/user_provider.dart';
import '../lib/login/login_page.dart';

void main1() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        home: LoginPage(),
      ),
    ),
  );
}
