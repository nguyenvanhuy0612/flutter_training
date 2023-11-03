import 'package:flutter/material.dart';
import 'package:flutter_training/home/home_page.dart';
import 'package:provider/provider.dart';

import 'login/login_page.dart';
import 'login/login_provider.dart';
import 'user/user_provider.dart';
import 'home/home_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        home: HomePage(), //LoginPage(),
      ),
    ),
  );
}
