import 'package:flutter/material.dart';
import 'package:flutter_training/user/user_provider.dart';
import 'package:provider/provider.dart';

import '../lib/login/login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    ),
  );
}
