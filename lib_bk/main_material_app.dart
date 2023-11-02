import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: LoginPage(),
    ),
  );
}
