import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LoginModel(),
      child: Shopee(),
    ),
  );
}

class Shopee extends StatelessWidget {
  const Shopee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
